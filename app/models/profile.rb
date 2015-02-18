class Profile < ActiveRecord::Base

  belongs_to :user

 # =========== SCOPES ============

 scope :search, lambda { |query|
  where( ["first_name LIKE ? OR last_name LIKE ?", "%#{query}%", "%#{query}%"])}

 
 # =========== Form Validation ============
 
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

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
  :default_url => "missing.png"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  # Validate the attached image is less than 4 MB
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 4.megabytes

end
