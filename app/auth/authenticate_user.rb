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
    if user
      expire_time = 3.months.from_now
      payload = { user_id: user.id, exp: expire_time.to_i }
      user.update token_expires_at: expire_time
      JWT.encode payload, ENV["HMAC_SECRET"], 'HS512'
    end
  end

  private

  def user
    user = User.where('phone_number=? OR username=?', login_credentials, login_credentials).first
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'Invalid credentials'
    nil
  end
end
