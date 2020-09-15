require "rails_helper"

RSpec.feature "Edit an Exercise" do
  before do
    @email = Faker::Internet.email
    @password = [*('a'..'z'), *('A'..'Z'), *(0..9)].sample(8).join
    @user = User.create({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: @email, password: @password})
    login_as(@user)
    @user_exercise = @user.exercises.create({:duration_in_minute => 10, :workout_date => Time.now, :workout_details => 'XYZ'})
  end

  scenario "with valid data" do
    visit "/"
    click_link "My Lounge"
    path= "/users/#{@user.id}/exercises/#{@user_exercise.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click
    fill_in "Duration", with: 50
    click_button "Update Exercise"
    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(50)
    expect(page).not_to have_content(48)
  end
end