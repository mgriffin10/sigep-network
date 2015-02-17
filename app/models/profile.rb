class Profile < ActiveRecord::Base

  belongs_to :user

 # Email
  	EMAIL_REGEX = /\A[a-z0-9._%+1]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
 	validates :email, 	:presence => true,
  						:length => {:maximum => 100},
  						:uniqueness => true,
  						:format => {:with => EMAIL_REGEX}

  # First Name
  	validates :first_name, 	:presence => true,
  						 	:length => {:maximum => 25}

  # Last Name
  	validates :last_name , 	:presence => true,
  						 	:length => {:maximum => 50}
  
  #Class Year
	validates :class_year, 	:presence => true,
						   	:length => {:maximum => 25},
 						   	:numericality => {:only_integer => true}

  # Industry
  # nil

  # Residence City
  	validates :residence_city, 	:presence => true,
  						 		:length => {:maximum => 50}

  # Residence State 
    validates :residence_state, :length => {:maximum => 2}

  # Residence Country
  	validates :residence_country, 	:presence => true,
  						 			:length => {:maximum => 50}

end
