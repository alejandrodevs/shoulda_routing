module ShouldaRouting
  module Resources
    module Method

      # This method provides a simple way to test the resources routes.
      def resources *args, &block
        Resources::Base.new(*args, &block).test!
      end

    end
  end
end
