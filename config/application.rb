require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsEc2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false
    end

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'models', '*.yml').to_s]

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Tokyo"
    # config.eager_load_paths << Rails.root.join("extras")
    #
    # バリデーションエラーが発生したときに'field_with_errors'というclassを付加しない
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
