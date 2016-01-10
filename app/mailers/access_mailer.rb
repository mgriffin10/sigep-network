class AccessMailer < ApplicationMailer

	def password_reset_message(user)
		@user = user
		@url = "http://localhost:3000/users/password_reset?id="
	    mail(
	      :to  => @user.email,
	      :from => 'no-reply@sigepgeorgetown.com',
	   	  :subject => 'SigeEp Network Password Reset Link')

  	end

end