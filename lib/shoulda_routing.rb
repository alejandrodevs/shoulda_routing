module ShouldaRouting
  autoload :DSL,     'shoulda_routing/dsl.rb'
  autoload :VERSION, 'shoulda_routing/version.rb'
  autoload :Spec,    'shoulda_routing/spec.rb'

  module Resources
    autoload :Base,   'shoulda_routing/resources/base.rb'
    autoload :DSL,    'shoulda_routing/resources/dsl.rb'
    autoload :Method, 'shoulda_routing/resources/method.rb'
    autoload :STACK,  'shoulda_routing/resources/stack.rb'
  end

  module Helpers
    autoload :Path,   'shoulda_routing/helpers/path.rb'
    autoload :Params, 'shoulda_routing/helpers/params.rb'
  end
end
