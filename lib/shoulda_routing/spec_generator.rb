module ShouldaRouting
  class SpecGenerator

    # Returns the callable object that contains the spec. The spec is generated
    # according to the params.
    def self.generate! via, path, resource, action, options
      Proc.new do
        it "routes to" do
          send(via, path).should route_to("#{resource}##{action}", options)
        end
      end
    end

  end
end
