require 'rails_helper'

RSpec.feature 'Destroying an exercise' do
  before do
    password = [*('a'..'b'), *('A'..'B'), *(0..9)].sample(8).join
    @user = User.create({first_name: 'vidur', last_name: 'Punj', email: Faker::Internet.email, password: password})
    @user_exercise = @user.exercises.create({workout_date: Date.today, duration_in_minute: 20, workout_details: 'Routine Workout'})
    login_as(@user)
  end

  scenario "Destroying the exercise created by the owner" do
    visit "/"
    click_link 'My Lounge'
    puts Exercise.last.inspect
    path = "/users/#{@user.id}/exercises/#{@user_exercise.id}"
    link = "//a[contains(@href, \'#{path}\') and .//text()='Destroy']"
    find(:xpath, link).click
    expect(page).to have_content("Exercise has been destroyed")
  end
end