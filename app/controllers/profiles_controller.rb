class ProfilesController < ApplicationController

 layout "profile"

 before_action :confirm_logged_in
  
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new()
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:notice] = "Profile #{@profile.first_name} #{@profile.last_name} created successfully."
			redirect_to(:action => 'index')
		else
			render('new')
		end
  end

  def edit
     @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:notice] = "Profile udpated success fully."
      redirect_to(:action => 'show', :id => @profile.id)
		else
			render('edit')
		end
	end

	def delete
    @profile = Profile.find(params[:id])
	end

	def destroy
    profile = Profile.find(params[:id]).destroy
    flash[:notice] = "Profile destroyed successfully."
		redirect_to(:action => 'index')
	end


	private

  def profile_params
    params.require(:profile).permit(:first_name,
                                    :last_name,
                                    :class_year,
                                    :residence_state,
                                    :residence_city,
                                    :residence_country,
                                    :industry,
                                    :email)
	end

end
