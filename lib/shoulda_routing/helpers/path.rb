module ShouldaRouting
  module Helpers
    module Path

      # Returns a string path according to an array.
      def generate_path stack, options = {}
        "/#{stack.join("/1/")}" + options[:suffix].to_s
      end

      # Returns the combinations according to an array
      # passed by param. This is in order to generate all
      # the nested routes.
      def route_combinations stack
        # pending
      end

    end
  end
end
