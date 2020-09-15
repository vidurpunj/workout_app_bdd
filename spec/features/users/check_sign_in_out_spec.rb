require 'rails_helper'

RSpec.feature 'Check'do
  before do
    @email = Faker::Internet.email
    @password = [*('a'..'z'), *('A'..'Z'), *(0..9)].sample(8).join
    User.create({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: @email, password: @password})
  end

  scenario 'check logout link' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
    click_button 'Log in'
    expect(page).to have_link('Logout')
  end

  scenario 'check Login link' do
    visit '/'
    expect(page).to have_link('Login')
    expect(page).to have_link('Sign Up')
  end

end