class User < ApplicationRecord
    before_create :produce_token

    has_many :events
    
    validates :username, presence:true
    validates :email, presence:true
    
    def produce_token
        self.user_token = SecureRandom.urlsafe_base64
    end

    def update_token
        update_attribute(:user_token, user_token)
    end

    def authenticated?(token)
        token == user_token
    end
    
end
