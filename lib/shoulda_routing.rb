module ShouldaRouting
  autoload :DSL,      'shoulda_routing/dsl.rb'
  autoload :VERSION,  'shoulda_routing/version.rb'

  module Routes
    autoload :Base,     'shoulda_routing/routes/base.rb'
    autoload :Restful,  'shoulda_routing/routes/base.rb'
    autoload :Single,   'shoulda_routing/routes/base.rb'
  end
end
