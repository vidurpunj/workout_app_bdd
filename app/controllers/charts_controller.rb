class ChartsController < ApplicationController
  def exercises_in_7_days
    render json: Exercise.last_7_days.pluck(:workout_date, :duration_in_minute)
  end

  def software_logged_in_users_info_country
    render json: SoftwareUserLoginInfo.group(:country).count
  end

  def software_type_usage
    render json: SoftwareUserLoginInfo.group(:software_type).count
  end
end
