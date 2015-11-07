class User < ActiveRecord::Base
    has_secure_password
    before_create :create_session_token
    validates :password, presence: true, length: {minimum: 6, maximum: 12}
    
    #def self.create_user! (hsh)
    #   hsh[:session_token] = SecureRandom.base64
    #   User.create!(hsh)
    #end
    private
    def create_session_token
       self.session_token = SecureRandom.base64 
    end
end