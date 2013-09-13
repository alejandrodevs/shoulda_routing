module ShouldaRouting
  class Resources
    extend ResourcesMethods

    cattr_accessor :current

    def self.nested
      @nested ||= []
    end

    def self.specs args
      options = generate_local_bindings

      Proc.new do
        it "routes to index" do
          send(:get, options[:index_path]).should route_to("#{options[:resource]}#index", options[:route_params])
        end

        it "routes to new" do
          send(:get, options[:new_path]).should route_to("#{options[:resource]}#new", options[:route_params])
        end

        it "routes to edit" do
          send(:get, options[:edit_path]).should route_to("#{options[:resource]}#edit", options[:route_params].merge(id: "1"))
        end

        it "routes to create" do
          send(:post, options[:create_path]).should route_to("#{options[:resource]}#create", options[:route_params])
        end

        it "routes to update" do
          send(:put, options[:update_path]).should route_to("#{options[:resource]}#update", options[:route_params].merge(id: "1"))
        end

        it "routes to show" do
          send(:get, options[:show_path]).should route_to("#{options[:resource]}#show", options[:route_params].merge(id: "1"))
        end

        it "routes to destroy" do
          send(:delete, options[:destroy_path]).should route_to("#{options[:resource]}#destroy", options[:route_params].merge(id: "1"))
        end
      end
    end

    def self.path
      "#{nested_path}/#{current}"
    end

    def self.nested_path
      "/#{nested.join("/1/")}/1" if nested.present?
    end

    def self.generate_local_bindings
      {
        :resource     => current,
        :index_path   => path,
        :new_path     => path + "/new",
        :edit_path    => path + "/1/edit",
        :create_path  => path,
        :update_path  => path + "/1",
        :show_path    => path + "/1",
        :destroy_path => path + "/1",
        :route_params => route_params
      }
    end

    def self.route_params
      options = {}
      nested.each do |resource|
        options.merge!({:"#{resource.to_s.singularize}_id" => "1"})
      end
      options
    end
  end
end
