require 'localeapp/rails'

Localeapp.configure do |config|
  config.api_key = ENV['LOCALEAPP_API_KEY']
  config.polling_environments   << :production
  config.reloading_environments << :production

  # Pull latest when dyno restarts in production
  if defined?(Rails) && Rails.env.production?
    Localeapp::CLI::Pull.new.execute
  end
end
