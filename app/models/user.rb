# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation, :locked
  	has_secure_password
 	before_save :create_remember_token
 	# after_initialize won't work here, for the following reason (section 9.2.7 in The Rails 3 Way):
 	# The after_initialize callback is invoked whenever a new Active Record model is instantiated 
 	# (either from scratch or from the database).
 	# after_initialize :set_defaults

	validates :name, presence: true, length: { maximum: 50 }
	valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
										format: { with: valid_email_regex }, 
										uniqueness: {case_sensitive: false}
	validates :password, length: { minimum: 6}

	private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def set_defaults
   	  self.locked = true
   	end
end
