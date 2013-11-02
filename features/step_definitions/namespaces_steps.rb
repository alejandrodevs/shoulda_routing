When /^I generate resources "([^\"]+)" in namespace "([^\"]+)"$/ do |resources, namespace|
  resources.split(" ").each do |resource|
    namespace_path = namespace.split("::").join("/")
    namespaces = namespace.split("::").map(&:camelcase).join("::")

    steps %{
      When I write to "app/controllers/#{namespace_path}/#{resource.pluralize}_controller.rb" with:
        """
        class #{namespaces}::#{resource.pluralize.camelcase}Controller < ApplicationController
          def index; end
          def show; end
          def edit; end
          def update; end
          def create; end
          def new; end
          def destroy; end
        end
        """
    }
  end
end
