module ShouldaRouting
  module Routes
    class Base

      def route path, resource, action, via, path_params
        Proc.new do
          it "routes to ##{action}" do
            send(via, path).should route_to("#{resource}##{action}", *path_params)
          end
        end
      end

      def route_options args = {}
        action   = args[:action]
        resource = args[:resource] || DSL::QueueResources.last
        method   = args[:method]   || route_methods[action]
        [route_path(action), resource, action, method, route_params(action)]
      end

      def route_methods
        {
          :index    => :get,
          :new      => :get,
          :show     => :get,
          :edit     => :get,
          :create   => :post,
          :update   => :put,
          :destroy  => :delete
        }
      end

      def route_path action
        path = "/#{DSL::QueueResources.join("/1/")}"
        case action
        when :new                     then path << "/new"
        when :show, :update, :destroy then path << "/1"
        when :edit                    then path << "/1/edit"
        end
        path
      end

      def route_params action
        options = {}
        options[:id] = "1" if [:show, :edit, :update, :destroy].include?(action)
        DSL::QueueResources.each do |route|
          options.merge!({:"#{route.to_s.singularize}_id" => "1"})
        end
        options.delete(:"#{DSL::QueueResources.last.to_s.singularize}_id")
        [options]
      end

    end
  end
end
