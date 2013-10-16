require 'localeapp/rails'

Localeapp.configure do |config|
  config.api_key = ENV['LOCALEAPP_API_KEY']

  # Pull latest when dyno restarts in production
  if defined?(Rails) && Rails.env.production?
    Localeapp::CLI::Pull.new.execute
  end
end
