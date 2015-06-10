class AccessController < ApplicationController
  
 before_action :confirm_logged_in, :except => [:login,:attempt_login,:logout]

  def index
    user_id = session[:user_id]
    @user = User.find(user_id)
  end

  def login
  	# login form 
  end

  def attempt_login
  	if params[:email].present? && params[:password].present?
  		found_user = User.where(:email => params[:email]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end
  	if authorized_user
  		session[:user_id] = authorized_user.id
      session[:role] = authorized_user.role
  		flash[:notice] = "You are now signed in."
      flash[:status] = "alert-success"
  		redirect_to(:controller => 'main', :action => 'index')
  	else
  		flash[:notice] = "Invalid email/password combination."
      flash[:status] = "alert-danger"
  		redirect_to(:action => 'login')
  	end
  end

  def logout
  	session[:user_id] = nil
    session[:role] = nil
  	flash[:notice] = "Signed out"
    flash[:status] = "alert-success"
  	redirect_to(:action => "login")
  end

end
