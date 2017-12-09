class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    @url  = "#{root_url}users/#{user.activation_token}/activate"

    mail(:to => user.email,
         :subject => "[Thomas Fire Help] Account Activation")
  end

  def activation_success_email(user)
    @user = user
    @url  = "#{root_url}login"
    mail(:to => user.email,
         :subject => "[Thomas Fire Help] Your account is now activated")
  end

  def reset_password_email(user)
    @user = User.find user.id
    @url  = edit_password_reset_url(@user.reset_password_token)
    mail(:to => user.email,
         :subject => "[Thomas Fire Help] Reset password")
  end
end