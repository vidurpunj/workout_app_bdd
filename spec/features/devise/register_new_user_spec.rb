require 'rails_helper'

RSpec.feature 'register' do
  scenario 'a new user' do
    visit "/"
    click_link 'Sign Up'
    fill_in 'First name', with: 'Vidur'
    fill_in 'Last name', with: 'Punj'
    fill_in 'Email', with: 'vidur.punj@hotmail.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Vidur Punj')
  end
end