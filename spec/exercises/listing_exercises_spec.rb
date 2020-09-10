require 'rails_helper'

RSpec.feature 'Listing exercises' do
  before do
    @email = Faker::Internet.email
    @password = [*('a'..'z'), *('A'..'Z'), *(0..9)].sample(8).join()
    @user = User.create({email: @email, password: @password,
                         first_name: Faker::Name.first_name, last_name: Faker::Name.last_name})
    @e1 = @user.exercises.create({duration_in_minute: 20, workout: 'My Body Building', workout_date: Date.today})
    @e2 = @user.exercises.create({duration_in_minute: 55, workout: 'Weight Lifting', workout_date: 2.days.ago})
    @e3 = @user.exercises.create({duration_in_minute: 80, workout: 'Cardio', workout_date: 10.days.ago})
    login_as(@user)
  end

  scenario "show user's workout in last 7 days's" do
    visit "/"
    click_link "My Lounge"
    expect(page).to have_content(@e1.duration_in_minute)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)

    expect(page).to have_content(@e2.duration_in_minute)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)

    expect(page).not_to have_content(@e3.duration_in_minute)
    expect(page).not_to have_content(@e3.workout)
    expect(page).not_to have_content(@e3.workout_date)

  end

  scenario "if no exercises is created" do
    @user.exercises.destroy_all
    visit "/"
    click_link "My Lounge"
    expect(page).to have_content('No workout Found!')
  end

end