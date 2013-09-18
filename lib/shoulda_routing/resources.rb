module ShouldaRouting
  class Resources
    include ResourcesMethod

    cattr_accessor :current

    def self.nested
      @nested ||= []
    end

    def actions
      [:index, :new, :edit, :create, :update, :show, :destroy]
    end

    def specs args
      actions.map do |action|
        SpecGenerator.generate!(
          via(action),
          path(action),
          current,
          action,
          options(action)
        )
      end
    end

    def via action
      case action
      when :index, :new, :edit, :show then :get
      when :create  then :post
      when :update  then :put
      when :destroy then :delete
      end
    end

    def path action
      basic_path + case action
      when :new  then "/new"
      when :edit then "/1/edit"
      when :update, :show, :destroy then "/1"
      else ""
      end
    end

    def basic_path
      "#{nested_path}/#{current}"
    end

    def nested_path
      "/#{self.class.nested.join("/1/")}/1" if self.class.nested.present?
    end

    def options action
      options = {}
      options.merge!(id: "1") if [:edit, :update, :show, :destroy].include?(action)
      self.class.nested.each do |resource|
        options.merge!({:"#{resource.to_s.singularize}_id" => "1"})
      end
      options
    end

  end
end
