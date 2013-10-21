# ShouldaRouting [![Build Status](https://travis-ci.org/alejandrogutierrez/shoulda_routing.png?branch=master)](https://travis-ci.org/alejandrogutierrez/shoulda_routing) [![Coverage Status](https://coveralls.io/repos/alejandrogutierrez/shoulda_routing/badge.png)](https://coveralls.io/r/alejandrogutierrez/shoulda_routing)

This gem aims to provide a simple DSL that looks like the rails routes DSL that is used in the routes.rb file.
This requires the [RSpec](https://github.com/rspec/rspec-rails) testing framework.

## Installation

Add this line to your application's Gemfile:

    gem 'shoulda_routing'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shoulda_routing

## Basic usage

In your routes.rb file:

```ruby
YourApp::Application.routes.draw do
  resources :users
  resources :posts, :accounts, :roles

  resources :countries do
    resources :states, :cities, except: :destroy
  end

  resources :comments, only: [:index, :show]
  resources :parents, controller: :users
end
```

In your routing_spec.rb file:

```ruby
require 'spec_helper'

describe "Routes" do
  resources :users
  resources :posts, :accounts, :roles

  resources :countries do
    resources :states, :cities, except: :destroy
  end

  resources :comments, only: [:index, :show]
  resources :parents, controller: :users
end
```

## TO-DO

* Support namespaces
* Support member and collection routes.
* Support single resources (get, post, put, delete) actions.

## Testing

To run the test suite you should run the default rake task:

    $ bundle exec rake

To run the unit tests:

    $ bundle exec rake spec:unit

To run the integration tests:

    $ bundle exec cucumber

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
