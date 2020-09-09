class ExercisesController < ApplicationController
  def index
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)
    if @exercise.save
      flash[:notice] = 'Exercise has been created'
      redirect_to user_exercise_path(current_user, @exercise.id)
    else
      flash[:alert] = 'Exercise has not been created'
      render :new
    end
  end

  def show

  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_minute, :workout_date, :user_id)
  end

end