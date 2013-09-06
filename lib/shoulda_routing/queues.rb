module ShouldaRouting
  module Queues

    def self.nested_resources
      @nested_resources ||= []
    end

    def self.resources_types
      @resources_types ||= []
    end

  end
end
