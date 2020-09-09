class AddFieldToExercise < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :workout_details, :text
  end
end
