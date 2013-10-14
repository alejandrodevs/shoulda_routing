require 'spec_helper'

module ShouldaRouting
  module Helpers
    describe Route do
      let!(:subject){ Class.send(:include, described_class).tap(&:new) }

      describe "#generate_path" do
        pending
      end

      describe "#route_combinations" do
        it "returns combinations accoring to an array" do
          stack     = [[1, 2]]
          expected  = [[1], [2]]
          expect(subject.route_combinations(stack)).to eq(expected)
        end

        it "returns combinations accoring to an array" do
          stack     = [[1, 2], [3, 4]]
          expected  = [[1, 3], [1, 4], [2, 3], [2, 4]]
          expect(subject.route_combinations(stack)).to eq(expected)
        end

        it "returns combinations accoring to an array" do
          stack     = [[1, 2], [3]]
          expected  = [[1, 3], [2, 3]]
          expect(subject.route_combinations(stack)).to eq(expected)
        end

        it "returns combinations accoring to an array" do
          stack     = [[1, 2], [3], [4, 5]]
          expected  = [[1, 3, 4], [1, 3, 5], [2, 3, 4], [2, 3, 5]]
          expect(subject.route_combinations(stack)).to eq(expected)
        end
      end
    end
  end
end
