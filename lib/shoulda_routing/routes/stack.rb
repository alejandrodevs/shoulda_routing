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
        permutations(stack).map do |segments|
          namespaces = segments[0...self.namespaces.count]
          resources  = segments[self.namespaces.count...segments.count]

          options = {}
          options[:segments]    = segments
          options[:url]         = "/#{namespaces.join("/")}/#{resources.join("/1/")}"
          options[:params]      = params(resources[0...-1])
          options[:controller]  = (namespaces + [segments.last]).join("/")
          options
        end
      end

      private

      def stack
        namespaces + resources
      end
    end

    STACK = Stack.new
  end
end
