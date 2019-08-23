class Event < ApplicationRecord
  belongs_to :user

  has_many :attendees, dependent: :destroy
  has_many :saved_users, through: :attendees, source: :user
end
