require 'spec_helper'

describe "Routes" do
  resources :users do
    resources :posts do
      resources :comments do
        resources :likes
      end
    end
  end
end
