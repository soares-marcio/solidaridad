require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Solidaridad
  class Application < Rails::Application

    config.time_zone = 'Brasilia'
    # config.autoload_paths += %W(#{config.root}/lib)
    config.encoding = "UTF-8"
    config.action_mailer.default_options = {
      charset:       "UTF-8",
      content_type: "text/plain"    
    }
    config.i18n.default_locale = 'pt-BR'
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
