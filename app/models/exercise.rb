class Exercise < ApplicationRecord
  ## associations
  belongs_to :user

  # validations
  validates :workout_date, :workout_details, :duration_in_minute, presence: true
  validates :duration_in_minute, numericality: { greater_than: 0}

  # alias attributes
  alias_attribute :workout, :workout_details
  alias_attribute :activity_date, :workout_date

  scope :last_7_days, -> { where('workout_date > ?', 7.days.ago).order(workout_date: :desc)}
end
