require 'rails_helper'

RSpec.feature 'follow friend' do

  before do
    @john = User.create({first_name: 'john', last_name: 'punj', email: 'john.punj@hotmail.com', password: 12345678})
    @peter = User.create({first_name: 'Peter', last_name: 'punj', email: 'peter.punj@hotmail.com', password: 12345678})
    login_as(@john)
  end

  scenario 'if signed_in' do
    visit "/"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@peter.full_name)

    href = "/friendships?friend_id=#{@john.id}"
    expect(page).not_to have_link("follow", href: href)

    link = "a[href='/firendships?friend_id=#{@peter.id}']"
    find(link).click()

    href = "/friendships?friend_id=#{@peter.id}"
    expect(page).not_to have_link("follow", href: href)
  end
end