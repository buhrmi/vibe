class SessionsController < ApplicationController
  before_action :require_user, only: [:show]
  
  def new
    render inertia: 'sessions/new' unless params[:provider]
  end

  def create
    return redirect_to user_path(current_user), notice: 'You are already logged in' if current_user
    if request.env['omniauth.auth'].present?
      create_from_omniauth
    else
      create_from_email
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end

  private
  def create_from_omniauth
    identity = Identity.from_omniauth!(request.env["omniauth.auth"], current_user)
    session[:user_id] = identity.user.id
    session[:after_login] ||= user_path(current_user)
    flash[:notice] = "You have been logged in."
    render layout: false
  end

  def create_from_email
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have been logged in."
      redirect_to current_user
    else
      flash[:error] = "Email or password is incorrect. Please try again."
      redirect_to new_session_path
    end
  end
end