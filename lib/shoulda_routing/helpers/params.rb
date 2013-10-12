module ShouldaRouting
  module Helpers
    module Params

      def generate_params stack, options
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
