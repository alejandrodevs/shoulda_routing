require 'spec_helper'

module ShouldaRouting
  module Namespaces
    describe Base do
      subject { described_class.new(:admin, options: "options") }

      describe "initialize" do
        it { expect(subject.options).to eq({options: "options"})}
        it { expect(subject.current).to eq([:admin]) }
      end

      describe "#test!" do
        pending
      end
    end
  end
end
