class Event < ApplicationRecord
  belongs_to :user

  scope :future_events, lambda {
                            where('date >= ?', DateTime.current)
                              .order(date: :asc)
                          }

                          

scope :past_events, lambda {
                            where('date < ?', DateTime.current)
                              .order(date: :asc)
                          }







  has_many :attendees, dependent: :destroy
  has_many :saved_users, through: :attendees, source: :user

  validates :eventype, presence:true
  validates :location, presence:true
  validates :date, presence:true
end
