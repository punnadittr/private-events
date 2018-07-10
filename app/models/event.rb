class Event < ApplicationRecord
  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }

  has_many :event_listings, :foreign_key => 'attended_event_id'
  has_many :attendees, :through => :event_listings
  belongs_to :creator, :class_name => 'User'
end
