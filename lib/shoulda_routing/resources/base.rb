module ShouldaRouting
  module Resources
    class Base

      attr_accessor :current, :options, :block

      def initialize *args, &block
        @options = args.extract_options!
        @current = args
        @block   = block
      end

      def test!
        STACK.push(current)

        actions.each do |action, via|
          Spec::Base.new(action: action, method: via).run!
        end

        DSL.instance_eval(&block) if block
        STACK.pop
      end

      private

      def actions
        {
          :index   => :get,
          :new     => :get,
          :edit    => :get,
          :show    => :get,
          :create  => :post,
          :update  => :put,
          :destroy => :delete
        }
      end

    end
  end
end
