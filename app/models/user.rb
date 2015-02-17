class User < ActiveRecord::Base

  has_secure_password

  has_many :profiles

  # Email 
 	EMAIL_REGEX = /\A[a-z0-9._%+1]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
 	validates :email, 	:presence => true,
  						:length => {:maximum => 100},
  						:uniqueness => true,
  						:format => {:with => EMAIL_REGEX}  
  # Password
  validates :password, :presence => true


end
