module ShouldaRouting
  module Spec
    class Base

      def initialize options
        @options = options
      end

      def run!
        RSpec::Core::DSL.describe type: :routing do
          # Here goes the spec.
        end
      end

    end
  end
end
