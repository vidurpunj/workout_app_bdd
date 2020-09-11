class ExercisesController < ApplicationController
  def index
    @exercises = current_user.exercises.last_7_days
    # byebug
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
    @exercise = current_user.exercises.find(params[:id])
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    redirect_to [current_user, :exercises]
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_minute, :activity_date, :workout, :user_id)
  end

end