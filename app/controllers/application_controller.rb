class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?
  helper_method :authenticate?


private

  def logged_in?
    session[:id].present?
  end

  def authenticate?
    session[:id] == @user.id
  end
end
