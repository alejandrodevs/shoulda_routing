module ShouldaRouting
  class Spec

    def self.execute! args
      RSpec::Core::DSL.describe type: :routing do
        it "routes to #{args[:path]}" do
          expect(args[:via] => args[:path]).to route_to("#{args[:controller]}##{args[:action]}", args[:params])
        end
      end
    end

  end
end
