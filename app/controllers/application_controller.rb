class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def current_user
    User.first
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

end
