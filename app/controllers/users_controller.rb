class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_request, only: %i[login register]

  def login
    authenticate params[:login], params[:password]
  end

  def register
    @user = User.create(user_params)
      if @user.save
        response = { message: 'User created successfully'}
        render json: response, status: :created
      else
        render json: @user.errors, status: :bad
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
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(
        :username,
        :phone_number,
        :password
      )
    end

    def authenticate(login, password)
      command = AuthenticateUser.call(login, password)

      if command.success?
        render json: {
        access_token: command.result,
        message: 'Login Successful'
        }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end
end
