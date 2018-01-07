class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
  end

  def authenticate
    return if logged_in?
    redirect_to root_path alert:"ログインしてください"
  end

end
