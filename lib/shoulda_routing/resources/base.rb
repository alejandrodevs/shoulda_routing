module ShouldaRouting
  module Resources
    class Base
      include Helpers::Route

      attr_accessor :current, :options, :block

      def initialize *args, &block
        @options = args.extract_options!
        @current = args
        @block   = block
      end

      def test!
        STACK.push(current)

        route_permutations(STACK).each do |stack|
          specs_for(routeable_actions, stack)
        end

        DSL.instance_eval(&block) if block
        STACK.pop
      end

      private

      def specs_for actions, stack
        actions.each do |action, args|
          Spec.execute!({
            :via        => args[:via],
            :path       => route_path(stack, suffix: args[:path]),
            :controller => stack.last,
            :action     => action,
            :params     => route_params(stack, args[:params] || {})
          })
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
