Feature: Test resources with options

  Background:
    When I generate a new rails application
    And I generate resources "user post comment like"
    And I configure the application to use rspec-rails
    And I run the rspec generator
    And I configure the application to use "shoulda_routing"

  Scenario: Add resources options
    Given I write to "config/routes.rb" with:
      """
      TestApp::Application.routes.draw do
      resources :posts, except: [:destroy, :update]

        resources :users do
          resources :posts, :comments, except: :destroy
          resources :likes, only: :index
        end

        resources :parents, controller: "users"
        resources :observations
      end
      """
    And I write to "spec/routing/routing_spec.rb" with:
      """
      require 'spec_helper'

      describe 'Routes' do
        resources :posts, except: [:destroy, :update]

        resources :users do
          resources :posts, :comments, except: [:destroy, :show]
          resources :likes, only: :destroy
        end

        resources :parents, controller: "users"
        resources :observations, controller: "comments"
      end
      """
    When I run routing specs
    Then the output should contain "49 examples, 11 failures"
