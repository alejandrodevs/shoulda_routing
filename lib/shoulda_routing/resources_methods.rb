module ShouldaRouting
  module ResourcesMethods

    def resources resource, args = {}, &block
      Resources.current = resource
      Module.describe type: :routing, &Resources.specs(args)

      Resources.nested.push(resource)
      Resources.instance_eval(&block) if block_given?
      Resources.nested.pop
    end

  end
end
