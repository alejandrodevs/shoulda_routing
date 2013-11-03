require 'spec_helper'

module ShouldaRouting
  module Routes
    describe STACK do
      it { should be_an_instance_of(Stack) }
    end

    describe Stack do
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

      describe "-#stack" do
        it "returns an array with resources and namespaces" do
          subject.stub(:namespaces).and_return([1,2,3])
          subject.stub(:resources).and_return([4,5,6])
          subject.send(:stack).should eq [1,2,3,4,5,6]
        end
      end
    end
  end
end
