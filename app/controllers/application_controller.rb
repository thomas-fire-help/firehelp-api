class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_request
  attr_reader :current_user
  include ExceptionHandler

  def authenticate_request
    authorization = AuthorizeApiRequest.call(request.headers)
    @current_user = authorization.result
    render json: { message: 'Not Authorized', errors: authorization.errors }, status: 401 unless @current_user
  end

  def require_admin
    authorization = AuthorizeApiRequest.call(request.headers)
    @current_user = authorization.result
    render json: { message: 'Not Authorized', errors: authorization.errors }, status: 401 unless @current_user.admin?
  end

  def require_moderator
    authorization = AuthorizeApiRequest.call(request.headers)
    @current_user = authorization.result
    render json: { message: 'Not Authorized', errors: authorization.errors }, status: 401 unless @current_user.moderator?
  end

  def require_verification
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { message: 'Not Authorized', error: "Phone number not verified" }, status: 401 unless @current_user.verified?
  end
end
