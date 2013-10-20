module ShouldaRouting
  module Routes
    class Spec

      attr_accessor :via, :path, :controller, :action, :params, :method

      def test!
        via, path, controller  = @via, @path, @controller
        action, params, method = @action, @params, @method

        RSpec::Core::DSL.describe type: :routing do
          it "routes to #{path}" do
            expect(via => path).send method || :to, route_to("#{controller}##{action}", params)
          end
        end
      end

      def self.execute
        generator = self.new
        yield(generator) if block_given?
        generator.test!
      end

    end
  end
end
