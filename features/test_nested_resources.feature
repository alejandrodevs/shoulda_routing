Feature: Test nested resources

  Background:
    When I generate a new rails application
    And I generate resources "user post"
    And I configure the application to use rspec-rails
    And I run the rspec generator
    And I configure the application to use "shoulda_routing"

  Scenario: Test nested resources
    Given I write to "config/routes.rb" with:
      """
      TestApp::Application.routes.draw do
        resources :users do
          resources :posts
        end
      end
      """
    And I write to "spec/routing/routing_spec.rb" with:
      """
      require 'spec_helper'

      describe 'Routes' do
        resources :users do
          resources :posts
        end
      end
      """
    When I run routing specs
    Then the output should contain "14 examples, 0 failures"

  Scenario: Missing nested resource
    Given I write to "config/routes.rb" with:
      """
      TestApp::Application.routes.draw do
        resources :users
      end
      """
    And I write to "spec/routing/routing_spec.rb" with:
      """
      require 'spec_helper'

      describe 'Routes' do
        resources :users do
          resources :posts
        end
      end
      """
    When I run routing specs
    Then the output should contain "14 examples, 7 failures"
