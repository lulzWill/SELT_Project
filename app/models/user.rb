class User < ActiveRecord::Base
    has_secure_password
    validates :password, presence: true, length: {minimum: 6, maximum: 12}
    validates :password_conf, presence: true
    
    def self.create_user! (hsh)
        hsh[:session_token] = SecureRandom.base64
        User.create!(hsh)
    end
    
    def create_session_token
       self.session_token = SecureRandom.urlsafe_base64 
    end
end