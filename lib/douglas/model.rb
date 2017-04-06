require 'douglas/model_config'

module Douglas
  module Model
    # rubocop:disable Style/PredicateName
    def has_stamps
      Douglas::ModelConfig.new(self).setup
    end
    # rubocop:enable all
  end
end
