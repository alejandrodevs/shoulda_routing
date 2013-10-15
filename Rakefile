require "bundler/gem_tasks"

namespace :spec do
  desc "Runs unit tests"
  task :unit do
    system("bundle exec rspec")
  end
end

task default: 'spec:unit'
