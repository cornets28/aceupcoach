class Appointment < ApplicationRecord
  belongs_to :coach_instructor
  belongs_to :user
  validates_presence_of :user_id, :coach_instructor_id, :appointment_start_date, :duration, :location, :coach_name
end
