class ApplicationController < ActionController::Base
  before_action :redirect_after_login
  
  before_action :set_locale
  
  # This will make validation errors available in form helpers
  # See https://inertiajs.com/forms#form-helper
  rescue_from ActiveRecord::RecordInvalid do |exception|
    raise exception unless request.inertia?
    session[:errors] = exception.record.errors
    redirect_back(fallback_location: root_path)
  end

  rescue_from ActionController::BadRequest do |exception|
    flash[:error] = exception.message
    redirect_back(fallback_location: root_path)
  end

  inertia_share do
    {
      current_user: current_user.try(:as_json),
      errors: session.delete(:errors),
      flash: flash.to_h
    }
  end

  def set_locale
    if current_user
      current_user.update locale: params[:locale] if params[:locale]
      locale = current_user.locale
    else
      locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      cookies[:locale] = params[:locale] if params[:locale]
      locale = cookies[:locale] if cookies[:locale]
    end
    I18n.locale = locale if I18n.locale_available?(locale)
  end
  
  private
  def require_user
    return if current_user
    session[:after_login] = request.fullpath
    redirect_to new_session_path, notice: "You must be logged in to access this page."
  end

  def redirect_after_login
    return unless current_user
    return unless session[:after_login]
    redirect_to session.delete(:after_login)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
