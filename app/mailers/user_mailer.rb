class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password.subject
  #
  def reset_password
    @user = params[:user]
    mail to: @user.email
  end

  def welcome
    @user = params[:user]
    mail to: @user.email
  end
end
