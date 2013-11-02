module ShouldaRouting
  module Namespaces
    class Base

      attr_accessor :current, :options, :block

      def initialize *args, &block
        @options = args.extract_options!
        @current = args
        @block   = block
      end

      def test!
        Routes::STACK.namespaces.push(current)
        DSL.instance_eval(&block) if block
        Routes::STACK.namespaces.pop
      end
    end
  end
end
