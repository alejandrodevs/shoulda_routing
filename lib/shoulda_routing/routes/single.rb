module ShouldaRouting
  module Routes
    class Single < Base

      def resource args
        route(*route_options(args))
      end

      def route_path action
        path  = "/#{Queues.nested_resources.join("/1/")}"
        path << "/1/#{action}" if Queues.resources_types.last == :member
        path << "/#{action}" if Queues.resources_types.last == :collection
        path
      end

      def route_params action
        options = {}
        options[:id] = "1" if Queues.resources_types.last == :member
        Queues.nested_resources.each do |route|
          options.merge!({:"#{route.to_s.singularize}_id" => "1"})
        end
        options.delete(:"#{Queues.nested_resources.last.to_s.singularize}_id")
        [options]
      end

    end
  end
end
