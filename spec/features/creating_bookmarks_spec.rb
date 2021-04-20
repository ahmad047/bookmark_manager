# frozen_string_literal: true

feature 'creating a new bookmark' do
  scenario 'user can create a new bookmark to the manager' do
    visit 'bookmarks/new'
    fill_in 'url', with: 'https://testbookmarks.com'
    click_button 'Submit'

    expect(page).to have_content 'https://testbookmarks.com'
  end
end
