require 'rails_helper'

RSpec.feature "Users SignUp" do
  before do
    @password = [*('a'..'z'), *('A'..'Z'),(0..9)].sample(8).join
  end

  scenario "with valid credentails" do
    visit "/"
    click_link "Sign Up"
    fill_in 'First name', with: Faker::Name.first_name
    fill_in 'Last name', with: Faker::Name.last_name
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: @password
    fill_in 'Password confirmation', with: @password
    click_button 'Sign up'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

end