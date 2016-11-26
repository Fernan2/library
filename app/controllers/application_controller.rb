class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_variant

  def set_variant
    request.variant = :phone if browser.device.mobile?
  end
end
