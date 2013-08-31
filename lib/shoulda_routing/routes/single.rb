module ShouldaRouting
  module Routes
    class Single < Base

      def resource args
        route(*route_options(args))
      end

      def route_path action
        path  = "/#{DSL::QueueResources.join("/1/")}"
        path << "/1/#{action}" if DSL::QueueResourcesTypes.last == :member
        path << "/#{action}" if DSL::QueueResourcesTypes.last == :collection
        path
      end

      def route_params action
        options = {}
        options[:id] = "1" if DSL::QueueResourcesTypes.last == :member
        DSL::QueueResources.each do |route|
          options.merge!({:"#{route.to_s.singularize}_id" => "1"})
        end
        options.delete(:"#{DSL::QueueResources.last.to_s.singularize}_id")
        [options]
      end

    end
  end
end
