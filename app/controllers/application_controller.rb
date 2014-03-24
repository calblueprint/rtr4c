class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
def authorize
  redirect_to login_url, alert: "Not authorized" if current_user.nil?
end

private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_card.id
    end
    @current_cart
  end
end
