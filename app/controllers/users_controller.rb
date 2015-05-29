class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
	    if @user.authenticate(user_params[:password])
	    	flash[:notice] = "User account created successfully. You are now logged in."
        flash[:status] = "alert-success"
	    	session[:user_id] = @user.id
	  		session[:email] = @user.email
			  redirect_to(:controller => 'profiles', :action => 'new', :id => @user.id)
  		else
  			flash[:notice] = "Please log in."
        flash[:status] = "alert-danger"
  			render('new')
  		end
  	else
  		render('new')
  	end
  end

  def edit
  	@user = User.find(session[:user_id])
  end

  def update
    @user = User.find(params[:id])
    @profile = Profile.where(:user_id => @user.id)
    if (user_params[:password] == user_params[:password_confirmation] && @user.authenticate(user_params[:password]))
      if !@profile.empty?
        if (@user.update_attributes(user_params) && @profile.update_attributes(:email => @user.email))
            flash[:notice] = "User information updated successfully."
            flash[:status] = "alert-success"
            redirect_to(:action => 'show', :id => @user.id)
        end
      else
        if @user.update_attributes(user_params)
            flash[:notice] = "User information updated successfully."
            flash[:status] = "alert-success"
            redirect_to(:action => 'show', :id => @user.id)
        end
      end
    else
      flash[:notice] = "Invalid password."
      flash[:status] = "alert-danger"
      redirect_to(:action => 'edit')
    end
  end
  
  private 

  def user_params
    	params.require(:user).permit(:email,
                                	:password,
                                	:password_confirmation)
	end

end
