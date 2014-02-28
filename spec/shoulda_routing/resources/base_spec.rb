require 'spec_helper'

module ShouldaRouting
  module Resources
    describe Base do
      subject { described_class.new(:users, except: :destroy) }

      describe "initialize" do
        it { expect(subject.options).to eq({except: :destroy})}
        it { expect(subject.target).to eq([:users]) }
      end

      describe "#test!" do
        pending
      end

      describe "-#specs_for" do
        pending
      end

      describe "-#actions" do
        it "retuns restful actions definition" do
          actions = {
            :index   => { via: :get },
            :create  => { via: :post },
            :new     => { via: :get, path: "/new" },
            :edit    => { via: :get, path: "/1/edit", params: { id: "1" }},
            :show    => { via: :get, path: "/1", params: { id: "1" }},
            :update  => { via: :put, path: "/1", params: { id: "1" }},
            :destroy => { via: :delete, path: "/1", params: { id: "1" }}
          }
          subject.send(:actions).should eq actions
        end
      end

      describe "-#routeable_actions" do
        pending
      end

      describe "-#unrouteable_actions" do
        pending
      end
    end
  end
end
