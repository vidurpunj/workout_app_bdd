class Exercise < ApplicationRecord
  ## associations
  belongs_to :user

  # validations
  validates :workout_date, :workout_details, :duration_in_minute, presence: true
end
