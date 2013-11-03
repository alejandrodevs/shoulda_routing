require 'spec_helper'

module ShouldaRouting
  module Routes
    describe Helpers do
      subject { Class.new.extend described_class }

      describe "#permutations" do
        it "returns permutations accoring to an array" do
          stack     = [[1, 2]]
          expected  = [[1], [2]]
          expect(subject.permutations(stack)).to eq(expected)
        end

        it "returns permutations accoring to an array" do
          stack     = [[1, 2], [3, 4]]
          expected  = [[1, 3], [1, 4], [2, 3], [2, 4]]
          expect(subject.permutations(stack)).to eq(expected)
        end

        it "returns permutations accoring to an array" do
          stack     = [[1, 2], [3]]
          expected  = [[1, 3], [2, 3]]
          expect(subject.permutations(stack)).to eq(expected)
        end

        it "returns permutations accoring to an array" do
          stack     = [[1, 2], [3], [4, 5]]
          expected  = [[1, 3, 4], [1, 3, 5], [2, 3, 4], [2, 3, 5]]
          expect(subject.permutations(stack)).to eq(expected)
        end
      end

      describe "#params" do
        it "returns params accoring to an array" do
          stack     = [:users, :posts, :likes]
          expected  = {user_id: "1", post_id: "1", like_id: "1"}
          expect(subject.params(stack)).to eq(expected)
        end
      end
    end
  end
end
