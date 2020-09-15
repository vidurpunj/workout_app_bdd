require 'rails_helper'

RSpec.feature 'search user' do
  before do
    @john = User.create({first_name: 'John', last_name: 'Punj', email: 'john.punj@hotmail.com', password: 12345678})
    @peter = User.create({first_name: 'Peter', last_name: 'Punj', email: 'peter.punj@hotmail.com', password: 12345678})
  end

  scenario 'with first name' do
    visit '/'

    fill_in 'search_name', with: 'John'
    click_button 'search user'
    expect(page).to have_content(@john.full_name)
    expect(current_path).to eq('/dashboard/search')
  end

  scenario 'with last name' do
    visit '/'

    fill_in 'search_name', with: 'punj'
    click_button 'search user'
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@peter.full_name)
    expect(current_path).to eq('/dashboard/search')
  end

end


