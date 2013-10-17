module ShouldaRouting
  module Helpers
    module Route

      # Returns a string path according to an array.
      def route_path stack, options = {}
        "/#{stack.join("/1/")}" + options[:suffix].to_s
      end

      # Returns the combinations according to an array passed by param.
      # This is in order to generate all the nested routes.
      def route_permutations stack
        stack.inject(&:product).map{|e| e.flatten rescue [e]}
      end

      def route_params stack, options = {}
        params = {}
        stack[0...stack.size - 1].each do |resource|
          params[:"#{resource.to_s.singularize}_id"] = "1"
        end
        params.merge!(options)
        params
      end

    end
  end
end
