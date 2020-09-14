class ExercisesController < ApplicationController
  before_action :set_exercise,  only: [:show, :edit, :update, :destroy]

  def index
    @exercises = current_user.exercises.last_7_days
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

  def update
    if @exercise.update(exercise_params)
      flash[:notice] = 'Exercise has been updated'
      redirect_to user_exercise_path(current_user, @exercise.id)
    else
      flash[:alert] = 'Exercise has not been updated'
      render :edit
    end
  end

  def show
    # @exercise = current_user.exercises.find(params[:id])
  end

  def edit
    # @exercise = Exercise.find(params[:id])
  end

  def destroy
    @exercise.destroy
    flash[:notice] = 'Exercise has been destroyed'
    # redirect_to [current_user, :exercises]
    redirect_to user_exercises_path
  end

  private

  def set_exercise
    @exercise = current_user.exercises.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:duration_in_minute, :activity_date, :workout, :user_id)
  end

end