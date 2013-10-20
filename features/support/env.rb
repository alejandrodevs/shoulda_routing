require 'aruba/cucumber'
require 'active_support/all'

Before do
  @aruba_timeout_seconds = 60 * 2
end
