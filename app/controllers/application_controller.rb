class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_application_page_infos

  private
    def set_application_page_infos
      @stylesheets = []
      @stylesheets_media_print = []
      @javascripts = []
      @body_class = ''
    end
end
