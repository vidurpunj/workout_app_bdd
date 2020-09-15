require 'rails_helper'

RSpec.feature 'listing users' do
  before do
    @john = User.create({first_name: 'John', last_name: 'Corner', email: 'john.corner@sample.com', password: '12345678'})
    @sarah = User.create({first_name: 'Sarah', last_name: 'Corner', email: 'sarah.corner@sample.com', password: '12345678'})
  end
  scenario 'Show the list of registered members' do
    visit '/'
    expect(page).to have_content('List of Members')
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
  end
end