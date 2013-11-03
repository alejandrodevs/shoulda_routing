require 'spec_helper'

module ShouldaRouting
  module Namespaces
    describe DSL do
      it { described_class.should respond_to :namespace }
      it { described_class.should respond_to :resources }
    end
  end
end
