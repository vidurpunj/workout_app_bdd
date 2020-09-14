class ChartsController < ApplicationController
  def exercises_in_7_days
    render json: Exercise.last_7_days.pluck(:workout_date, :duration_in_minute)
  end
end
