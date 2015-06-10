module ApplicationHelper

	def error_messages_for(object)
		render(:partial => "application/error_messages", :locals => {:object => object})
	end

	def profile_exists?
		!Profile.where(:user_id => session[:user_id]).blank?
	end

	def student?
		session[:role] == "student"
	end
end
