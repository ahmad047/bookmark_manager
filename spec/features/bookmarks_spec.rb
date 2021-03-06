# frozen_string_literal: true

feature 'shows Bookmarks page' do
  scenario 'it visits /bookmarks' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'shows bookmarks' do
    create_test_bookmarks

    visit '/bookmarks'
    expect(page).to have_link('bbc', href: 'https://www.bbc.co.uk/news')
    expect(page).to have_link('google', href: 'https://www.google.com/')
    expect(page).to have_link('codewars', href: 'https://www.codewars.com/dashboard')
  end
end
