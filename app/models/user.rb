class User < ActiveRecord::Base
    has_and_belongs_to_many :courses
    has_many :assignments, :through => :courses
    
    has_secure_password
    
    #validates :password, presence: true, length: {minimum: 6, maximum: 12}
    
    #def self.create_user! (hsh)
    #   hsh[:session_token] = SecureRandom.base64
    #   User.create!(hsh)
    #end
end