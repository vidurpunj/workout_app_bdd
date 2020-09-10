require 'rails_helper'

RSpec.feature 'creating exercise' do
  before do
    @email = Faker::Internet.email
    @password = [*('a'..'z'), *('A'..'Z'), *(0..9)].sample(8).join
    @user = User.create({email: @email, password: @password})
    login_as(@user)
  end

  scenario 'with valid inputs' do
    visit "/"
    click_link 'My Lounge'
    click_link 'New Workout'
    expect(page).to have_link('Back')
    fill_in 'Duration', with: 70
    fill_in 'Workout Details', with: 'Weight lifting'
    fill_in 'Activity date', with: '2016-07-26'
    click_button 'Create Exercise'
    expect(page).to have_content("Exercise has been created")
    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@user, exercise))
    expect(exercise.user_id).to eq(@user.id)
  end

  scenario 'with invalid inputs' do
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"
    fill_in 'Duration', with: ''
    fill_in 'Workout Details', with: ''
    fill_in 'Activity date', with: ''
    click_button "Create Exercise"
    expect(page).to have_content('Exercise has not been created')
    expect(page).to have_content('errors prohibited the exercise to be saved.')
  end
end