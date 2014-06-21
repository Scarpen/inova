require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PlataformaInovatech
  class Application < Rails::Application
    config.i18n.enforce_available_locales = false
    config.i18n.available_locales = ["en", "pt-BR"]
    config.i18n.default_locale = :"pt-BR"
    config.time_zone = 'Brasilia'
  end
end
