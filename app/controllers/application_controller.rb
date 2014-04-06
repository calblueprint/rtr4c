class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
def authorize
  redirect_to login_url, alert: "Not authorized" if current_user.nil?
end

helper_method :current_user
helper_method :current_cart # makes this method available in views and controllers.

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def current_cart
  if Cart.where(:id => session[:cart_id]).blank?
    @current_cart = Cart.create!
    session[:cart_id] = @current_cart.id
  end
  @current_cart ||= Cart.find(session[:cart_id])
  @current_cart
end
end
