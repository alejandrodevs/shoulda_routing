Feature: Test resources with options

  Background:
    When I generate a new rails application
    And I generate resources "user post comment like"
    And I configure the application to use rspec-rails
    And I run the rspec generator
    And I configure the application to use "shoulda_routing"

  Scenario: When only and except options are added
    Given I write to "config/routes.rb" with:
      """
      TestApp::Application.routes.draw do
        resources :users, only: [:index, :show]
        resources :posts, except: [:destroy]
      end
      """
    And I write to "spec/routing/routing_spec.rb" with:
      """
      require 'spec_helper'

      describe 'Routes' do
        resources :users, only: [:index, :show]
        resources :posts, except: [:destroy]
      end
      """
    When I run routing specs
    Then the output should contain "14 examples, 0 failures"

  Scenario: When only and except options are wrong
    Given I write to "config/routes.rb" with:
      """
      TestApp::Application.routes.draw do
        resources :users, only: [:index, :show]
        resources :posts, except: [:destroy]
      end
      """
    And I write to "spec/routing/routing_spec.rb" with:
      """
      require 'spec_helper'

      describe 'Routes' do
        resources :users, only: [:index, :show, :update]
        resources :posts, except: [:destroy, :edit]
      end
      """
    When I run routing specs
    Then the output should contain "14 examples, 2 failures"

  Scenario: When only and except options are added in nested resources
    Given I write to "config/routes.rb" with:
      """
      TestApp::Application.routes.draw do
        resources :users do
          resources :posts, :comments, except: [:destroy]
          resources :likes, only: [:index]
        end
      end
      """
    And I write to "spec/routing/routing_spec.rb" with:
      """
      require 'spec_helper'

      describe 'Routes' do
        resources :users do
          resources :posts, :comments, except: [:destroy]
          resources :likes, only: [:index]
        end
      end
      """
    When I run routing specs
    Then the output should contain "28 examples, 0 failures"

  Scenario: When only and except options in nested resources are wrong.
    Given I write to "config/routes.rb" with:
      """
      TestApp::Application.routes.draw do
        resources :users do
          resources :posts, :comments, except: [:destroy]
          resources :likes, only: [:index]
        end
      end
      """
    And I write to "spec/routing/routing_spec.rb" with:
      """
      require 'spec_helper'

      describe 'Routes' do
        resources :users do
          resources :posts, :comments, except: [:show]
          resources :likes, only: [:destroy]
        end
      end
      """
    When I run routing specs
    Then the output should contain "28 examples, 6 failures"
