class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      ENV["SECRET_AUTH_TOKEN"] == token
    end
  end
end

