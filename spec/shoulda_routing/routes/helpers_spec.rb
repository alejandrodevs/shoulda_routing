require 'spec_helper'

module ShouldaRouting
  module Routes
    describe Helpers do
      let!(:subject){ Class.send(:include, described_class).tap(&:new) }

      describe "#route_path" do
        it "returns string path accoring to an array" do
          stack    = [:users, :posts, :likes]
          expected = "/users/1/posts/1/likes"
          expect(subject.route_path(stack)).to eq(expected)
        end
      end

      describe "#route_permutations" do
        it "returns permutations accoring to an array" do
          stack     = [[1, 2]]
          expected  = [[1], [2]]
          expect(subject.route_permutations(stack)).to eq(expected)
        end

        it "returns permutations accoring to an array" do
          stack     = [[1, 2], [3, 4]]
          expected  = [[1, 3], [1, 4], [2, 3], [2, 4]]
          expect(subject.route_permutations(stack)).to eq(expected)
        end

        it "returns permutations accoring to an array" do
          stack     = [[1, 2], [3]]
          expected  = [[1, 3], [2, 3]]
          expect(subject.route_permutations(stack)).to eq(expected)
        end

        it "returns permutations accoring to an array" do
          stack     = [[1, 2], [3], [4, 5]]
          expected  = [[1, 3, 4], [1, 3, 5], [2, 3, 4], [2, 3, 5]]
          expect(subject.route_permutations(stack)).to eq(expected)
        end
      end

      describe "#route_params" do
        it "returns params accoring to an array" do
          stack     = [:users, :posts, :likes]
          expected  = {user_id: "1", post_id: "1"}
          expect(subject.route_params(stack)).to eq(expected)
        end
      end
    end
  end
end
