module ShouldaRouting
  module Namespaces
    module Method

      # This method provides a simple way to support namespaces.
      def namespace *args, &block
        Namespaces::Base.new(*args, &block).test!
      end

    end
  end
end
