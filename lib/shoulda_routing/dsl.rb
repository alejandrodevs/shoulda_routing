module ShouldaRouting
  module DSL

    def resources resource, args = {}
      Queues.nested_resources.push(resource)
      routes.resource(args).each{ |spec| instance_eval(&spec) }
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

    [:get, :post, :put, :patch, :delete].each do |method|
      define_method "#{method}_action" do |action|
        instance_eval(&route.resource(action: action, method: method))
      end
    end

    private

      def routes
        @routes ||= Routes::Restful.new
      end

      def route
        @route  ||= Routes::Single.new
      end

  end
end
