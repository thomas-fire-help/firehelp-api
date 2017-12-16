class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :verify, :verify_post, :resend_verification, :send_password_reset, :reset_password]
  skip_before_action :authenticate_request, only: %i[login register send_password_reset reset_password]
  before_action :require_admin, only: [:index, :destroy]

  def login
    authenticate params[:login], params[:password]
  end

  def register
    @user = User.create(user_params)
    if @user.save && @user.generate_pin && @user.send_pin
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all.page((params[:page] || 0)).per((params[:per_page] || Settings.default.per_page))
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
    render json: { error: 'Not Authorized' }, status: 401 unless current_user == @user || current_user.moderator?
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    render json: { error: 'Not Authorized' }, status: 401 unless current_user == @user || current_user.moderator?
    respond_to do |format|
      if @user.update(user_params)
        format.json { render :show, status: :ok, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    render json: { error: 'Not Authorized' }, status: 401 unless current_user == @user || current_user.moderator?
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def resend_verification
    render json: { error: 'Not Authorized' }, status: 401 unless current_user == @user || current_user.moderator?
    if @user.generate_pin && @user.send_pin
      render json: { message: 'Resent Verification Token' }, status: :ok
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  def verify
    render json: { error: 'Not Authorized' }, status: 401 unless current_user == @user || current_user.moderator?
    if @user.verify(params[:pin].to_i)
      render json: { message: 'User verified successfully' }, status: :ok
    else
      render json: { message: 'Invalid verification' }, status: :unprocessable_entity
    end
  end

  def send_password_reset
    if @user.send_password_reset(params[:url])
        render json: { message: 'Password reset sent' }, status: :ok
    else
      render json: { message: 'No URL sent'}, status: :unprocessable_entity
    end
  end

  def reset_password
    if params[:token]
      if @user.reset_password_token == params[:token]
        if @user.reset_password_token_expires_at > DateTime.now
          if @user.update password: params[:password], reset_password_token: nil, reset_password_sent_at: nil, reset_password_token_expires_at: nil
            render json: { message: 'Password reset successful' }, status: :ok
          else
            render json: { message: "Password couldn't be reset"}, status: :unprocessable_entity
          end
        else
          render json: { message: 'Token Expired'}, status: :unprocessable_entity
        end
      else
        render json: { message: 'Token invalid'}, status: :unprocessable_entity
      end
    else
      render json: { message: 'No token'}, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :phone_number, :password)
  end

  def authenticate(login, password)
    command = AuthenticateUser.call(login, password)

    if command.success?
      render json: { access_token: command.result, message: 'Login Successful' }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
