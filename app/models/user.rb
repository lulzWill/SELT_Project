class User < ActiveRecord::Base
    def self.create_user! (hsh)
        hsh[:session_token] = SecureRandom.base64
        User.create!(hsh)
    end
end