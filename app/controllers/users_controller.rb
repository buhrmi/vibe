class UsersController < ApplicationController
  wrap_parameters :user, include: [:email, :password, :name]
  before_action :normalize_url, only: [:show]
  
  def new
    render inertia: 'users/new'
  end

  def show
    user = User.find_by!(name: params[:name])
    render inertia: 'users/show', props: {
      user: user.as_json(only: [:name])
    }
  end

  def create
    return redirect_to user_path(current_user), notice: 'You are already logged in' if current_user
    user = User.create!(create_params.merge(locale: I18n.locale))
    session[:user_id] = user.id
    redirect_to current_user
  end

  private
  def create_params
    params.require(:user).permit(:name, :email, :password)
  end

  def normalize_url
    if request.path.starts_with?('/users/')
      redirect_to "/#{params[:name]}" 
    end
  end
end
