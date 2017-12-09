class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    phone_number = User.where('phone_number=? OR username=?', params[:phone_number], params[:phone_number]).first.try(:phone_number)
    if @user = login(phone_number, params[:password])
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
