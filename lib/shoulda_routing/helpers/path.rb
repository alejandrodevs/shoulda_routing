module ShouldaRouting
  module Helpers
    module Path

      # Returns a string path according to an array.
      def generate_path stack, options = {}
        "/#{stack.join("/1/")}" + options[:suffix].to_s
      end

    end
  end
end
