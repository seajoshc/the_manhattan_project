class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  # redirect user to login if they are not
  def user_logged_in?
    return if logged_in?
    flash[:alert] = 'You must be logged in to do that!'
    redirect_to request.referrer
  end # user_logged_in?
end
