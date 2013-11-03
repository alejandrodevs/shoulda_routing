require 'spec_helper'

module ShouldaRouting
  module Resources
    describe DSL do
      it { described_class.should respond_to :resources }
    end
  end
end
