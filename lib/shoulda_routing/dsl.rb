module ShouldaRouting
  module DSL

    def resources resource, args = {}
      Queues.nested_resources.push(resource)
      restful_routes.resource(args).each{ |spec| instance_eval(&spec) }
      yield if block_given?
      Queues.nested_resources.pop
    end

    def member
      Queues.resouces_types.push(:member)
      yield if block_given?
      Queues.resouces_types.pop
    end

    def collection
      Queues.resouces_types.push(:collection)
      yield if block_given?
      Queues.resouces_types.pop
    end

    [:get, :post, :put, :patch, :delete].each do |via|
      define_method "#{via}_action" do |action|
        instance_eval(&single_route.resource(action: action, method: via))
      end
    end

    private

      def restful_routes
        @restful_routes ||= Routes::Restful.new
      end

      def single_route
        @single_route ||= Routes::Single.new
      end

  end
end
