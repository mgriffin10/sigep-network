class AccessMailer < ApplicationMailer

	def password_reset_message()
		print "Sending Email ..."
		# http://localhost:3000/users/password_reset?id=2
	    mail(
	      :to  => 'nickrnathan@gmail.com',
	      :from => 'no-reply@sigepgeorgetown.com',
	   	  :subject => 'Hello from Postmark')
	    
	    print "Email sent."
  	end

end