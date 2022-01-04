class PasswordResetsController < ApplicationController
  def index
    redirect_to new_password_reset_path
  end

  def new
    render inertia: 'password_resets/new'
  end

  def create
    user = User.find_by_email(params[:email])
    user.try(:reset_password!)
    render inertia: 'password_resets/create'
  end

  def show
    user = User.where('password_reset_token_created_at > ?', 24.hours.ago).where(password_reset_token: params[:id]).first
    if user
      render inertia: 'password_resets/show'
    else
      flash[:error] = "This link is invalid or has expired."
      redirect_to new_session_path
    end
  end

  def destroy
    user = User.where('password_reset_token_created_at > ?', 24.hours.ago).where(password_reset_token: params[:id]).first
    if user
      user.password_reset_token = nil
      user.password_reset_token_created_at = nil
      user.password = params[:password]
      user.save!
      redirect_to new_session_path, notice: 'Your password has been reset. You can log in now.'
    else
      flash[:error] = "This link is invalid or has expired."
      redirect_to new_session_path
    end
  end
end
