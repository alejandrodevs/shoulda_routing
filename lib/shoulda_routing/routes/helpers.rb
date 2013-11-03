module ShouldaRouting
  module Routes
    module Helpers

      def permutations stack
        stack.inject(&:product).map{|e| e.flatten rescue [e]}
      end

      def params stack
        params = {}
        stack.each{ |e| params[:"#{e.to_s.singularize}_id"] = "1" }
        params
      end

    end
  end
end
