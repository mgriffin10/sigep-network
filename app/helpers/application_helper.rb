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

	def sortable(column, title = nil)
		title ||= column.titleize
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, :sort => column, :direction => direction
	end
	
end
