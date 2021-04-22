# frozen_string_literal: true

feature 'creating a new bookmark' do
  scenario 'user can create a new bookmark to the manager' do
    visit 'bookmarks/new'
    fill_in 'url', with: 'https://testbookmarks.com'
    fill_in('title', with: 'Test Bookmark')
    click_button 'Submit'

    expect(page).to have_link('Test Bookmark', href: 'https://testbookmarks.com')
  end
end
