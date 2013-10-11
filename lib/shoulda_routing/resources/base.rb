module ShouldaRouting
  module Resources
    class Base

      attr_accessor :current, :options, :block

      def initialize args, &block
        @options = args.extract_options!
        @current = args
        @block   = block
      end

      def test!
        actions.each do |action|

        end

        STACK.push(current)
        DSL.instance_eval(&block) if block
        STACK.pop
      end

      private

      def actions
        [:index, :new, :edit, :create, :update, :show, :destroy]
      end

    end
  end
end
