class User < ApplicationRecord
  has_many :event_listings, :foreign_key => :event_attendee_id
  has_many :attended_events, :through => :event_listings
  has_many :created_events, :foreign_key => :creator_id, :class_name => "Event"
end