Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  config.assets.compile = false
  config.assets.digest = true

  config.log_level = :debug #:info

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.logger = Logger.new("log/production.log","daily")
  config.logger.level = Logger::INFO
  config.logger.formatter = Logger::Formatter.new
  config.logger.datetime_format = "%Y-%m-%d %H:%M:%S"

  config.active_record.raise_in_transactional_callbacks = true

  config.active_record.dump_schema_after_migration = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: 'ik1-344-32259.vs.sakura.ne.jp' }
  config.action_mailer.delivery_method = :letter_opener_web

=begin #TODO 必要ならSMTP設定する
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { :host => ENV['DOWNLOAD_URL'] || 'nativenews.jp' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => 'smtp.gmail.com',
    :port => 587,
    :domain => 'vectorinc.co.jp',
    :user_name => 'service@vectorinc.co.jp',
    :password => 'service159',
    :authentication => :plain,
    :enable_starttls_auto => true
  }
=end
end
