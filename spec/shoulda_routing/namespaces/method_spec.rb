require 'spec_helper'

module ShouldaRouting
  module Namespaces
    describe Method do
      subject { Class.new.extend described_class }

      describe "#namespace" do
        it "calls Namespaces::Base test! method with correct params" do
          namespace_instance = Namespaces::Base.new
          namespace_instance.stub(:test!).and_return("tested!")

          Namespaces::Base.should_receive(:new).
                           with(:admin, option: 1).
                           exactly(1).times.
                           and_return(namespace_instance)

          subject.namespace(:admin, option: 1).should eq "tested!"
        end
      end
    end
  end
end
