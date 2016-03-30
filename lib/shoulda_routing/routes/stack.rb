module ShouldaRouting
  module Routes
    class Stack
      include Routes::Helpers

      def resources
        @resources ||= []
      end

      def namespaces
        @namespaces ||= []
      end

      def stack
        namespaces + resources
      end

      def routes
        permutations(stack).map do |segments|
          namespaces = segments[0...self.namespaces.count]
          resources  = segments[self.namespaces.count...segments.count]

          options = {}
          options[:segments]    = segments
          options[:url]         = "/#{namespaces.join('/')}/#{resources.join('/1/')}"
          options[:params]      = params(resources[0...-1])
          options[:controller]  = (namespaces + [segments.last]).join('/')
          options
        end
      end

      def test routeable_actions, unrouteable_actions, options
        Routes::STACK.routes.each do |route|
          specs_for(routeable_actions, route, options)
          specs_for(unrouteable_actions, route, options, :not_to)
        end
      end

      private

      def specs_for actions, route, options, spec_method = :to
        actions.each do |action, args|
          Routes::Spec.execute do |config|
            config.via        = args[:via]
            config.path       = route[:url] + (args[:path] || '')
            config.controller = options[:controller] || route[:controller]
            config.action     = action
            config.params     = route[:params].merge(args[:params] || {})
            config.method     = spec_method
          end
        end
      end
    end

    STACK = Stack.new
  end
end
