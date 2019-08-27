class User < ApplicationRecord
    has_secure_password
    has_many  :events

    #for those invited to the created events
    has_many :attendee, dependent: :destroy


    #user has (n) saved guests for the created events
    has_many :saved_attendee, through: :attendee, source: :event

    validates :username, presence:true
    validates :email, presence:true
    

    
end
