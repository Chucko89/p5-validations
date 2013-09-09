class Event < ActiveRecord::Base
	validates :organizer_name, presence: {message: "You forgot to enter your name!" }

	validates :organizer_email, format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/,
	message: "Not a valid email!" }

	validates :title, presence: { message: "You forgot to enter an event name!" }
	validates :title, uniqueness: { message: "This event name has already been used!" }
	validate :date, :cant_be_date_in_past

	def cant_be_date_in_past
		errors.add(:date, "You entered a date that has passed") unless self.date > Date.today
	end
end
