module ShouldaRouting
  module Namespaces
    class Base

      attr_accessor :target, :options, :block

      def initialize *args, &block
        @options = args.extract_options!
        @target  = args
        @block   = block
      end

      def test!
        Routes::STACK.namespaces.push(target)
        DSL.instance_eval(&block) if block
        Routes::STACK.namespaces.pop
      end
    end
  end
end
