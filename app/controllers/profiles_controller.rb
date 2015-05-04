class ProfilesController < ApplicationController

 before_action :confirm_logged_in
 before_action :set_dropdown_arrays

  def index
    @profiles = Profile.all
  end

  def search
    @profiles = Profile.search(params[:q])
  end

  def show
    if params[:user_id]
      user_id = params[:id]
      @user = User.find(user_id)
      profile_id = lookup_profile_id(user_id)
      @profile = Profile.find(profile_id)
    else
      @profile = Profile.find(params[:id])
    end
  end

  def new
    @profile = Profile.new()
    @user = User.find(params[:id])
  end

  def create
    @profile = Profile.new(profile_params)
    @user = User.find(params[:id])
    @profile.user_id = @user.id
    @profile.email = @user.email
    if @profile.save
      flash[:notice] = "Profile #{@profile.first_name} #{@profile.last_name} created successfully."
			redirect_to(:action => 'show', :id => @user.id, :user_id => true)
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
      flash[:notice] = "Profile updated successfully."
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
                                    :career_details,
                                    :bio,
                                    :email,
                                    :avatar)
	end

  def lookup_profile_id(user_id)
    profile = Profile.where(:user_id => user_id).first
    profile.id
  end

  def set_dropdown_arrays
    @industries = [ 
    '',  
    'Agriculture',
    'Accounting',
    'Advertising',
    'Aerospace',
    'Aircraft',
    'Airline',
    'Apparel & Accessories',
    'Automotive',
    'Banking',
    'Broadcasting',
    'Brokerage',
    'Biotechnology',
    'Call Centers',
    'Cargo Handling',
    'Chemical',
    'Computer',
    'Consulting',
    'Consumer Products',
    'Cosmetics',
    'Defense',
    'Department Stores',
    'Education',
    'Electronics',
    'Energy',
    'Entertainement & Leisure',
    'Executive Search',
    'Financial Services',
    'Food, Beverage & Tobacco',
    'Grocery',
    'Health Care',
    'Internet Publishing',
    'Investment Banking',
    'Legal',
    'Manufacturing',
    'Motion Picture & Video',
    'Music',
    'Newspaper Publishing',
    'Online Auctions',
    'Pension Funds',
    'Pharmaceuticals',
    'Private Equity',
    'Publishing',
    'Real Estate',
    'Retail & Wholesale',
    'Securities & Commodity Exchanges',
    'Service',
    'Software',
    'Sports',
    'Technology',
    'Telecommunications',
    'Television',
    'Transportation',
    'Trucking',
    'Venture Capital']
    
    @states = ['','international',
      'AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS',
      'KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY',
      'NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV',
      'WI','WY','AS','DC','FM','GU','MH','MP','PW','PR']
  end

end
