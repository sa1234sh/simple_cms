class AdminUser < ApplicationRecord

	
has_secure_password

has_and_belongs_to_many :pages
has_many :section_edits
#has_many :section_edits, :through => :section_edits

EMAIL_REGEX = /\A[a-z0-9.%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
FORBIDDEN_USERS = "humptydumpty , marymary"
# validates_presence_of :first_name
# validates_length_of :first_name, :maximum => 25
# validates_presence_of :last_name
# validates_length_of :last_name, :maximum => 50
# validates_presence_of :username
# validates_length_of :username, :within => 8..25
# validates_uniqueness_of :username
# validates_presence_of :email
# validates_length_of :email, :maximum => 100
# validates_format_of :email, :within => EMAIL_REGEX
# validates_conformation_of :email


validate :username_is_allowed

scope :sorted , lambda {order('last_name ASC , first_name ASC')}

def name
	"#{first_name} #{last_name}"
end

private 

def username_is_allowed
	if FORBIDDEN_USERS.include?(username)
		errors.add(:username , "has been ristriced from use .")
	end
end

end
