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
	    	flash[:notice] = "User account #{@user.first_name} #{@user.last_name} created successfully. You are now logged in."
	    	session[:user_id] = @user.id
	  		session[:email] = @user.email
			redirect_to(:controller => 'access', :action => 'index')
		else
			flash[:notice] = "Please log in."
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
    if @user.update_attributes(user_params)
      flash[:notice] = "User information udpated successfully."
      redirect_to(:action => 'show', :id => @user.id)
		else
			render('edit')
		end
  end
  
  private 

  	def user_params
    	params.require(:user).permit(:first_name,
                                	:last_name,
                                	:email,
                                	:password,
                                	:password_confirmation)
	end

end
