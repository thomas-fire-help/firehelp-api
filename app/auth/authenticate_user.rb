# app/auth/authenticate_user.rb
class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :login_credentials, :password

  #this is where parameters are taken when the command is called
  def initialize(login_credentials, password)
    @login_credentials = login_credentials
    @password = password
  end

  #this is where the result gets returned
  def call
    access_token = JsonWebToken.encode(user_id: user.id) if user
    {access_token: token, user: user}
  end

  private

  def user
    user = User.where('phone_number=? OR username=?', login_credentials, login_credentials).first
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'Invalid credentials'
    nil
  end
end
