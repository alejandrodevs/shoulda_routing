require 'spec_helper'

module ShouldaRouting
  describe DSL do
    it { should include(Resources::Method) }
    it { should include(Namespaces::Method) }
  end
end
