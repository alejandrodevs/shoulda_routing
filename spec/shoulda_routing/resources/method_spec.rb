require 'spec_helper'

module ShouldaRouting
  module Resources
    describe Method do
      subject { Class.new.extend described_class }

      describe "#resources" do
        it "calls Resources::Base test! method with correct params" do
          resource_instance = Resources::Base.new
          resource_instance.stub(:test!).and_return("tested!")

          Resources::Base.should_receive(:new).
                          with(:users, except: :destroy).
                          exactly(1).times.
                          and_return(resource_instance)

          subject.resources(:users, except: :destroy).should eq "tested!"
        end
      end
    end
  end
end
