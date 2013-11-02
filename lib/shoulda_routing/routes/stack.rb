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

      def routes
        routes = route_permutations(self.namespaces + self.resources)
        routes.map do |route|
          permutations = {}
          namespaces = route[0...self.namespaces.count]
          resources  = route[self.namespaces.count...route.count]

          permutations[:segments] = route
          permutations[:url]      = route_path(namespaces, "/") + route_path(resources, "/1/")
          permutations[:params]   = route_params(resources)
          permutations[:controller] = route_path(namespaces + [route.last], "/").sub(/^\//, "")
          permutations
        end
      end
    end

    STACK = Stack.new
  end
end
