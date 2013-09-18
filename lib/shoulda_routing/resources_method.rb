module ShouldaRouting
  module ResourcesMethod

    def resources resource, args = {}, &block
      Resources.current = resource

      Resources.new.specs(args).each do |spec|
        Module.describe(type: :routing, &spec)
      end

      Resources.nested.push(resource)
      Resources.new.instance_eval(&block) if block_given?
      Resources.nested.pop
    end

  end
end
