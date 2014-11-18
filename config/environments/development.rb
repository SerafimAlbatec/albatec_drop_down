Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  config.action_mailer.default_url_options = {:host => 'localhost:3000'} 
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true #If set to false, mail will be not delivered in 
  #reality, but you can see it in the terminal logs. In development it is false by default, but I 
  #suggest to make it true even in development as you can check it directly in your mail box. 
  #For testing if you do not want to use a real email id, you can create dummy email 
  #on http://www.yopmail.com/en/
  #config.action_mailer.raise_delivery_errors = true # it will show error while delivering the mail. 
  #generally people keep it false in production environment
  config.action_mailer.default :charset => "utf-8"

  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    authentication: 'plain',
    enable_starttls_auto: true,
    user_name: 'serafimalbatec@gmail.com', # this should be a real gmail id
    password: 'serafim1992', # this should be real password of your gmail id
    :enable_starttls_auto => true
  }
end
