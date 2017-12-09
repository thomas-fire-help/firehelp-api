class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :verify, :verify_post, :resend_verification]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    redirect_to user_path(current_user) if current_user
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    redirect_to root_path if current_user != @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save && @user.generate_pin && @user.send_pin
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    redirect_to root_path if current_user != @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def resend_verification
    @user.generate_pin
    @user.send_pin
    redirect_to :back
  end

  def verify
  end

  def verify_post
    if @user.verify(params[:pin].to_i)
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully verified.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to verify_user_path(@user), notice: 'Incorrect Verification' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :phone_number, :password, :password_confirmation)
    end
end
