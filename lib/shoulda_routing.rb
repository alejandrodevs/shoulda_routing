module ShouldaRouting
  autoload :DSL,     'shoulda_routing/dsl.rb'
  autoload :VERSION, 'shoulda_routing/version.rb'

  module Resources
    autoload :Base,   'shoulda_routing/resources/base.rb'
    autoload :DSL,    'shoulda_routing/resources/dsl.rb'
    autoload :Method, 'shoulda_routing/resources/method.rb'
    autoload :STACK,  'shoulda_routing/resources/stack.rb'
  end

  module Routes
    autoload :Spec,    'shoulda_routing/routes/spec.rb'
    autoload :Helpers, 'shoulda_routing/routes/helpers.rb'
  end
end

if defined? RSpec
  RSpec.configure{ |config| config.extend ShouldaRouting::DSL }
end
