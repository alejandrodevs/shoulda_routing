Feature: integrate with Rails

  Background:
    When I generate a new rails application
    And I generate scaffolds
    And I configure the application to use rspec-rails
    And I run the rspec generator
    And I configure the application to use "shoulda_routing"

  Scenario: Test resources routes
    And I write to "config/routes.rb" with:
      """
      TestApp::Application.routes.draw do
        resources :users
      end
      """
    And I write to "spec/routing/routing_spec.rb" with:
      """
      require 'spec_helper'

      describe 'Routes' do
        resources :users
      end
      """
    When I successfully run `bundle exec rspec spec/routing/routing_spec.rb`
    Then the output should contain "7 examples, 0 failures"
