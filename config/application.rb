require File.expand_path('../boot', __FILE__)

require 'rails/all'
#require 'csv' # 必要なら出す

Bundler.require(*Rails.groups)

module Auburn
  class Application < Rails::Application
    config.i18n.default_locale = 'ja'

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      "<span class='field_with_errors'>#{html_tag}</span>".html_safe
    }

    # 表示時のタイムゾーンをJSTに変更
    config.time_zone = 'Tokyo'
    # DB保存時のタイムゾーンをJSTに変更(OSのタイムゾーンにあわせる)
    config.active_record.default_timezone = :local
    # lib autoload
    config.autoload_paths += %W(#{config.root}/lib)

    config.action_controller.include_all_helpers = false

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
