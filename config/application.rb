require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Discussions
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.exceptions_app = self.routes


    # Configuration for the application, engines, and railties goes here.
     
    config.after_initialize do
      ActionText::ContentHelper.allowed_attributes.add 'style'
      ActionText::ContentHelper.allowed_attributes.add 'controls'
      ActionText::ContentHelper.allowed_attributes.add 'poster'

      ActionText::ContentHelper.allowed_tags.add 'video'
      ActionText::ContentHelper.allowed_tags.add 'audio'
      ActionText::ContentHelper.allowed_tags.add 'source'
      ActionText::ContentHelper.allowed_tags.add 'embed'
      ActionText::ContentHelper.allowed_tags.add 'iframe'
    end
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end







