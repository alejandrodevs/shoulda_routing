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

      describe "#stack" do
        it "returns an array with resources and namespaces" do
          subject.stub(:namespaces).and_return([1,2,3])
          subject.stub(:resources).and_return([4,5,6])
          subject.send(:stack).should eq [1,2,3,4,5,6]
        end
      end

      describe "#routes" do
        it "returns an array of hashes with all the routes" do
          subject.stub(:namespaces).and_return([[:admin], [:control]])
          subject.stub(:resources).and_return([[:users], [:posts, :comments], [:likes]])
          expected = [
            {
              segments:   [:admin, :control, :users, :posts, :likes],
              url:        "/admin/control/users/1/posts/1/likes",
              params:     {user_id: "1", post_id: "1"},
              controller: "admin/control/likes"
            },
            {
              segments:   [:admin, :control, :users, :comments, :likes],
              url:        "/admin/control/users/1/comments/1/likes",
              params:     {user_id: "1", comment_id: "1"},
              controller: "admin/control/likes"
            }
          ]
          subject.routes.should eq expected
        end

        it "returns an array of hashes with all the routes" do
          subject.stub(:namespaces).and_return([[:mobile], [:v1]])
          subject.stub(:resources).and_return([[:users], [:posts, :comments], [:likes, :photos]])
          expected = [
            {
              segments:   [:mobile, :v1, :users, :posts, :likes],
              url:        "/mobile/v1/users/1/posts/1/likes",
              params:     {user_id: "1", post_id: "1"},
              controller: "mobile/v1/likes"
            },
            {
              segments:   [:mobile, :v1, :users, :posts, :photos],
              url:        "/mobile/v1/users/1/posts/1/photos",
              params:     {user_id: "1", post_id: "1"},
              controller: "mobile/v1/photos"
            },
            {
              segments:   [:mobile, :v1, :users, :comments, :likes],
              url:        "/mobile/v1/users/1/comments/1/likes",
              params:     {user_id: "1", comment_id: "1"},
              controller: "mobile/v1/likes"
            },
            {
              segments:   [:mobile, :v1, :users, :comments, :photos],
              url:        "/mobile/v1/users/1/comments/1/photos",
              params:     {user_id: "1", comment_id: "1"},
              controller: "mobile/v1/photos"
            }
          ]
          subject.routes.should eq expected
        end
      end
    end
  end
end
