require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module RailsLogs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.lograge.enabled = true
    config.lograge.formatter = Lograge::Formatters::Graylog2.new

    config.logger = GELF::Logger.new(
      ENV.fetch('GRAYLOG_ENDPOINT'),
      ENV.fetch('GRAYLOG_PORT'),
      'WAN',
      {facility: ENV.fetch('GRAYLOG_FACILITY'),
      host: ENV.fetch('GRAYLOG_HOST')},
  )
  end
end