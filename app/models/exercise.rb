class Exercise < ApplicationRecord
  ## associations
  belongs_to :user

  # validations
  validates :workout_date, :workout_details, :duration_in_minute, presence: true

  # alias attributes
  alias_attribute :workout, :workout_details
  alias_attribute :activity_date, :workout_date

end
