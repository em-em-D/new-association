# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  before_create :produce_token

  has_many :events

  has_many :attendaces, class_name: 'Attendace',
                        foreign_key: 'attendee_id',
                        dependent: :destroy

  has_many :attended_events, through: :attendaces, source: :attended_event

  validates :username, presence: true
  validates :email, presence: true

  def produce_token
    self.user_token = SecureRandom.urlsafe_base64
  end

  def update_token
    update_attribute(:user_token, user_token)
  end

  def authenticated?(token)
    token == user_token
  end

  def event?(event)
    events.include? event
  end

  def attended_event?(event)
    attended_events.include? event
  end

  def upcoming?
    DateTime.parse(date).to_date&.future?
  end

  def attendee?(user)
    attendees.include? user
  end

  def attend(event)
    attended_event_ids.push event
  end

  def leave(event)
    attended_events.delete event
  end
end
