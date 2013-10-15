require 'spec_helper'

describe "Routes" do
  resources :users
  resources :comments, :likes

  resources :posts do
    resources :comments, :likes
  end
end
