class Event < ApplicationRecord
  belongs_to :user

  scope :upcoming_events, lambda {
                            where('date >= ?', DateTime.current).order(date: :asc)}

  scope :past_events, lambda {
                                where('date < ?', DateTime.current).order(date: :asc)}
  

  def upcoming?
    date&.future?
  end
  validates :eventype, presence:true
  validates :description, presence:true
  validates :date, presence:true
  validates :location, presence:true
  validates :user_id, presence:true

end
