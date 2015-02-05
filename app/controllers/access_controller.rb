class AccessController < ApplicationController
  
 layout 'user'

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
  		flash[:notice] = "You are now logged in."
  		redirect_to(:action => 'index')
  	else
  		flash[:notice] = "Invalid email/password combination."
  		redirect_to(:action => 'login')
  	end
  end

  def logout
  	flash[:notice] = "Logged out"
  	redirect_to(:action => "login")
  end


end
