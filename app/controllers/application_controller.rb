class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_request
  attr_reader :current_user
  include ExceptionHandler

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def require_admin
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user.admin?
  end
end
