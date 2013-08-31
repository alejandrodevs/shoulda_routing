module ShouldaRouting
  module DSL

    QueueResources      = []
    QueueResourcesTypes = []

    # Tests the default routes to a specific resource. Requires the controller
    # name like a symbol. Example...
    #
    #   resources :users
    #
    # This provides nested routing testing too. To do it just pass a block
    # Example...
    #
    #   resources :users do
    #     resources :roles
    #   end
    #
    # And member and collection routes fuctionality. Example...
    #
    #   resources :users do
    #     resources :roles do
    #       member do
    #         get_action :detail
    #       end
    #     end
    #
    #     collection do
    #       post_action :authorize
    #     end
    #   end
    #
    def resources resource, args = {}
      QueueResources.push(resource)
      routes.send(:resource, args).each{ |route| instance_eval(&route) }
      yield(self) if block_given?
      QueueResources.pop
    end

    def member
      QueueResourcesTypes.push(:member)
      yield(self) if block_given?
      QueueResourcesTypes.pop
    end

    def collection
      QueueResourcesTypes.push(:collection)
      yield(self) if block_given?
      QueueResourcesTypes.pop
    end

    [:get, :post, :put, :patch, :delete].each do |verb|
      define_method "#{verb}_action" do |action|
        instance_eval(&route.send(:resource, action: action, method: verb))
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
