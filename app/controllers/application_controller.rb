class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_variant
  before_action :set_locale

  def set_variant
    request.variant = :phone if browser.device.mobile?
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale]
  end
end
