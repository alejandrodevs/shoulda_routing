require 'spec_helper'

describe "Routes" do
  resources :users
  resources :comments, :likes, only: [:index, :show]

  resources :posts do
    resources :comments, :likes, except: [:destroy]
  end
end
