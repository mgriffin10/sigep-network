module AccessHelper

	def profile_exists?
		 !Profile.where( :user_id => @user.id ).blank?
	end
end
