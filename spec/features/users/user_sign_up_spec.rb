require 'rails_helper'

RSpec.feature 'Sign in User' do
  before do
    @email = Faker::Internet.email
    @password = [*('a'..'z'), *('A'..'Z'), *(0..9)].sample(8).join
    User.create({email: @email, password: @password})
  end

  scenario 'with valid credentials' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content("signed in as #{@email}")
  end

  scenario 'with invalid credentials' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with:  @email = Faker::Internet.email  ## Any Random email
    fill_in 'Password', with: '12345678' ## Random password
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
