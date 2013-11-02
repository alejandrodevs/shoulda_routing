module ShouldaRouting
  module Resources
    class Base

      attr_accessor :current, :options, :block

      def initialize *args, &block
        @options = args.extract_options!
        @current = args
        @block   = block
      end

      def test!
        Routes::STACK.resources.push(current)

        Routes::STACK.routes.each do |route|
          specs_for(routeable_actions, route)
          specs_for(unrouteable_actions, route, :not_to)
        end

        DSL.instance_eval(&block) if block
        Routes::STACK.resources.pop
      end

      private

      def specs_for actions, route, spec_method = :to
        actions.each do |action, args|
          Routes::Spec.execute do |config|
            config.via        = args[:via]
            config.path       = route[:url] + (args[:path] || "")
            config.controller = options[:controller] || route[:controller]
            config.action     = action
            config.params     = route[:params].merge(args[:params] || {})
            config.method     = spec_method
          end
        end
      end

      def actions
        {
          :index   => { via: :get },
          :create  => { via: :post },
          :new     => { via: :get, path: "/new" },
          :edit    => { via: :get, path: "/1/edit", params: { id: "1" }},
          :show    => { via: :get, path: "/1", params: { id: "1" }},
          :update  => { via: :put, path: "/1", params: { id: "1" }},
          :destroy => { via: :delete, path: "/1", params: { id: "1" }}
        }
      end

      def routeable_actions
        @routeable_actions ||= begin
          routeable_actions = actions.keys
          routeable_actions = actions.keys & Array(options[:only]) if options[:only]
          routeable_actions = actions.keys - Array(options[:except]) if options[:except]
          actions.select{ |action, args| routeable_actions.include?(action) }
        end
      end

      def unrouteable_actions
        @unrouteable_actions ||= begin
          actions.select{ |action, args| !routeable_actions.include?(action) }
        end
      end

    end
  end
end
