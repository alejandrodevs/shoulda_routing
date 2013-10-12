module ShouldaRouting
  module Resources
    class Base
      include Helpers::Path
      include Helpers::Params

      attr_accessor :current, :options, :block

      def initialize *args, &block
        @options = args.extract_options!
        @current = args
        @block   = block
      end

      def test!
        STACK.push(current)

        routeable_actions.each do |action, args|
          Spec.execute!({
            :via        => args[:via],
            :path       => generate_path(STACK.flatten, suffix: args[:path]),
            :controller => STACK.flatten.last,
            :action     => action,
            :params     => generate_params(STACK.flatten, Hash(args[:params]))
          })
        end

        DSL.instance_eval(&block) if block
        STACK.pop
      end

      private

      def actions
        {
          :index   => { via: :get },
          :new     => { via: :get, path: "/new" },
          :edit    => { via: :get, path: "/1/edit", params: { id: "1" }},
          :show    => { via: :get, path: "/1", params: { id: "1" }},
          :create  => { via: :post},
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
