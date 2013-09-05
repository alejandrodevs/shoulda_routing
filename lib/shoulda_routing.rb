module ShouldaRouting
  autoload :DSL,      'shoulda_routing/dsl.rb'
  autoload :Queues,   'shoulda_routing/queues.rb'
  autoload :VERSION,  'shoulda_routing/version.rb'

  module Routes
    autoload :Base,     'shoulda_routing/routes/base.rb'
    autoload :Restful,  'shoulda_routing/routes/restful.rb'
    autoload :Single,   'shoulda_routing/routes/single.rb'
  end
end
