class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # admin password is adminpass
  def confirm_logged_in
  	unless session[:user_id]
  		flash[:notice] = "Please log in."
  		redirect_to(:controller => 'access', :action => 'login')
  		return false # halts the before action
  	else
  		return true
  	end
  end
  
end
