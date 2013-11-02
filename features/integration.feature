Feature: Features integration

  Background:
    When I generate a new rails application
    And I generate resources "user post comment likes role account"
    And I generate resources "user post comment likes role account" in namespace "admin"
    And I generate resources "user post comment likes role account" in namespace "admin::control"
    And I configure the application to use rspec-rails
    And I run the rspec generator
    And I configure the application to use "shoulda_routing"

  Scenario: Support nested namespaces
    Given I write to "config/routes.rb" with:
      """
      TestApp::Application.routes.draw do
        namespace :admin do
          resources :users do
            resources :posts, :comments
          end

          namespace :control do
            resources :roles, only: :index
            resources :accounts, except: :destroy
          end
        end

        resources :users do
          resources :posts, :comments
        end
      end
      """
    And I write to "spec/routing/routing_spec.rb" with:
      """
      require 'spec_helper'

      describe 'Routes' do
        namespace :admin do
          resources :users do
            resources :posts, :comments
          end

          namespace :control do
            resources :roles, only: :index
            resources :accounts, except: :update
          end
        end

        resources :users do
          resources :posts, :comments, :likes
        end
      end
      """
    When I run routing specs
    Then the output should contain "63 examples, 9 failures"
