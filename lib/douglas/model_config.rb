module Douglas
  class ModelConfig
    def initialize(model_class)
      @model_class = model_class
    end

    # Set up `@model_class` for Douglas. Installs callbacks.
    def setup
      @model_class.before_create do |r|
        r.created_by = Douglas.the_stamper
      end

      @model_class.before_save(on: :update) do |r|
        r.updated_by = Douglas.the_stamper
      end
    end
  end
end
