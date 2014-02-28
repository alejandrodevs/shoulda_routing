module ShouldaRouting
  module Resources
    class Base

      attr_accessor :target, :options, :block

      def initialize *args, &block
        @options = args.extract_options!
        @target  = args
        @block   = block
      end

      def test!
        Routes::STACK.resources.push(target)
        Routes::STACK.test(routeable_actions, unrouteable_actions, options)
        DSL.instance_eval(&block) if block
        Routes::STACK.resources.pop
      end

      private

      def actions
        {
          index:    { via: :get },
          create:   { via: :post },
          new:      { via: :get, path: '/new' },
          edit:     { via: :get, path: '/1/edit', params: { id: '1' }},
          show:     { via: :get, path: '/1', params: { id: '1' }},
          update:   { via: :put, path: '/1', params: { id: '1' }},
          destroy:  { via: :delete, path: '/1', params: { id: '1' }}
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
