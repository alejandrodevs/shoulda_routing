require 'spec_helper'

module ShouldaRouting
  module Routes
    describe STACK do
      it { should be_an_instance_of(Stack) }
      it { subject.class.should include(Routes::Helpers) }

      describe "#resources" do
        it "returns a cached array" do
          subject.resources.should eq []
          subject.resources.push(:users)
          subject.resources.should eq [:users]
        end
      end

      describe "#namespaces" do
        it "returns a cached array" do
          subject.namespaces.should eq []
          subject.namespaces.push(:admin)
          subject.namespaces.should eq [:admin]
        end
      end

      describe "#routes" do
        pending
      end
    end
  end
end
