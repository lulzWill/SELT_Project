class User < ActiveRecord::Base
    has_and_belongs_to_many :course, foreign_key: 'course'
    has_secure_password
    validates :password, presence: true, length: {minimum: 6, maximum: 12}
    
    def self.create_user! (hsh)
        hsh[:session_token] = SecureRandom.base64
        User.create!(hsh)
    end
end