PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..')).freeze
APP_NAME = 'test_app'


When 'I generate a new rails application' do
  steps %{
    When I run `bundle exec rails new #{APP_NAME} --skip-bundle`
    And I cd to "#{APP_NAME}"
    And I install gems
  }
end

When /^I generate resources "([^\"]+)"$/ do |resources|
  resources.split(" ").each do |resource|
    steps %{ When I successfully run `rails generate scaffold #{resource}` }
  end

  steps %{
    When I successfully run `bundle exec rake db:migrate RAILS_ENV=test`
  }
end

When /^I configure the application to use "([^\"]+)"$/ do |name|
  append_to_gemfile "gem '#{name}', :path => '#{PROJECT_ROOT}'"
  steps %{And I install gems}
end

When 'I configure the application to use rspec-rails' do
  append_to_gemfile %q(gem 'rspec-rails', '~> 2.14.0')
  steps %{When I install gems}
end

When /^I install gems$/ do
  steps %{When I run `bundle install --local`}
end

When 'I run the rspec generator' do
  steps %{When I successfully run `rails generate rspec:install`}
end

When 'I run routing specs' do
  steps %{When I successfully run `bundle exec rspec spec/routing/routing_spec.rb --failure-exit-code 0`}
end

module FileHelpers
  def append_to(path, contents)
    in_current_dir do
      File.open(path, 'a') do |file|
        file.puts
        file.puts contents
      end
    end
  end

  def append_to_gemfile(contents)
    append_to('Gemfile', contents)
  end
end

World(FileHelpers)
