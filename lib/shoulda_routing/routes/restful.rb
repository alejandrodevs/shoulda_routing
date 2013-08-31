module ShouldaRouting
  module Routes
    class Restful < Base

      ACTIONS = [:index, :new, :show, :edit, :create, :update, :destroy]

      def resource args
        ACTIONS.map do |action|
          route(*route_options(action: action))
        end
      end

    end
  end
end
