require 'douglas/model_config'

module Douglas
  module Model
    def has_stamps
      Douglas::ModelConfig.new(self).setup
    end
  end
end
