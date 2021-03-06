require 'w_platform/w_platform_authentication'
require 'w_platform/w_platform_config'
require 'w_platform/w_platform_feature'

module WPlatform
  class Engine < Rails::Engine
    WConfig = WPlatformConfig
    WFeature = WPlatformFeature
    initializer "engine.add_middleware" do
      WPlatformConfig.load(Rails.root, Rails.env)
      WPlatformFeature.load(Rails.root)
      ActionView::Base.send :include, WPlatformHelper
    end
 
  end
end
