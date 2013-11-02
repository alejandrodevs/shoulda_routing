module ShouldaRouting
  module Routes
    class Segments
      def resources
        @resources ||= []
      end

      def namespaces
        @namespaces ||= []
      end
    end
  end
end
