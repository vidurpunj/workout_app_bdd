require 'rails_helper'

RSpec.feature "Sign out a user" do
  before do
    @email = Faker::Internet.email
    @password = [*('a'..'z'),*('A'..'Z'), *(0..9)].sample(8).join
    @user = User.create({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: @email, password: @password})
    # sign_in(@user) ##warden short cut
  end

  scenario 'already signed in' do
    visit("/")
    click_link('Login')
    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
    click_button 'Log in'
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end


end