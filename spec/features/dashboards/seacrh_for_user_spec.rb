require 'rails_helper'

RSpec.feature 'search user' do
  before do
    @john = User.create({first_name: 'John', last_name: 'Punj', email: 'vidur.punj@hotmail.com', password: 12345678})
    @merry = User.create({first_name: 'Merry', last_name: 'Punj', email: 'vidur.punj@hotmail.com', password: 12345678})
  end

  scenario 'with first name' do
    visit '/'

    fill_in 'search_name', with: 'vidur'
    click_button 'search user'
    expect(page).to have_content(@john.full_name)
    expect(page).not_to have_content(@merry.full_name)
    expect(curren_path).to eq('/dashboard/search')
  end

  pending 'with last name' do
    visit '/'

    fill_in 'search_name', with: 'vidur'
    click_button 'search user'
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@merry.full_name)
    expect(curren_path).to eq('/dashboard/search')
  end

end


