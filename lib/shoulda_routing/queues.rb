module ShouldaRouting
  module Queues

    def self.nested_resources
      @nested_resources ||= NestedResources.new
    end

    def self.resources_types
      @resources_types ||= ResourcesTypes.new
    end

    class NestedResources < Array; end
    class ResourcesTypes < Array; end
  end
end
