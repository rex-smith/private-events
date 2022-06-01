class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances

  # def self.past
  #   @events = Event.where('date < ?', DateTime.now)
  # end

  # def self.future
  #   @events = Event.where('date >= ?', DateTime.now)
  # end

  scope :past, -> { where('date < ?', DateTime.now) }
  scope :future, -> { where('date >= ?', DateTime.now )}

end
