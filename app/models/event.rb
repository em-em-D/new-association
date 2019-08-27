class Event < ApplicationRecord
  belongs_to :user

  validates :eventype, presence:true
  validates :description, presence:true
  validates :date, presence:true
  validates :location, presence:true
  validates :user_id, presence:true
end
