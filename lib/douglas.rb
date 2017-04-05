require 'request_store'
require 'douglas/version'
require 'douglas/model'

module Douglas
  class << self
    def the_stamper
      RequestStore.store[:the_stamper]
    end

    def the_stamper= user
      RequestStore.store[:the_stamper] = user
    end
  end
end

if defined?(::Rails) && ActiveRecord::VERSION::STRING >= '3.2'
  require 'douglas/frameworks/rails'
end
