class AccessController < ApplicationController
  
 layout 'user'

 before_action :confirm_logged_in, :except => [:login,:attempt_login,:logout]

  def index
  	#display text and link
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
  		session[:email] = authorized_user.email
  		flash[:notice] = "You are now logged in."
  		redirect_to(:action => 'index')
  	else
  		flash[:notice] = "Invalid email/password combination."
  		redirect_to(:action => 'login')
  	end
  end

  def logout
  	session[:user_id] = nil
  	session[:email] = nil
  	flash[:notice] = "Logged out"
  	redirect_to(:action => "login")
  end

end
