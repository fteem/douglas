require 'request_store'
require 'douglas/version'

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
