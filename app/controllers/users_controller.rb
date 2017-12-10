class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :verify, :verify_post, :resend_verification]
  skip_before_action :authenticate_request, only: %i[login register]

  def login
    authenticate params[:login], params[:password]
  end

  def register
    @user = User.create(user_params)
    if @user.save && @user.generate_pin && @user.send_pin
      response = { message: 'User created successfully'}
      render json: response, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
    redirect_to root_path if current_user != @user
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    redirect_to root_path if current_user != @user
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
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def resend_verification
    if current_user.generate_pin && current_user.send_pin
      response = { message: 'Resent Verification Token'}
      render json: response, status: :ok
    else
      render json: { message: 'Something went wrong' }, status: :bad
    end
  end

  def verify
    if current_user.verify(params[:pin].to_i)
      response = { message: 'User verified successfully'}
      render json: response, status: :ok
    else
      render json: { message: 'Invalid verification' }, status: :bad
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
