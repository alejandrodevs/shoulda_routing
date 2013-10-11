module ShouldaRouting
  module Spec
    class Runner

      # This method receives an callable object and it is sent as a block
      # to describe method in RSpec DSL.
      def self.execute spec
        RSpec::Core::DSL.describe(type: :routing, &spec)
      end

    end
  end
end
