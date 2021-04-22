# frozen_string_literal: true

feature 'shows Bookmarks page' do
  scenario 'it visits /bookmarks' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'shows bookmarks' do
    BookmarkManager.create(url: 'https://www.bbc.co.uk/news')
    BookmarkManager.create(url: 'https://www.google.com/')
    BookmarkManager.create(url: 'https://www.codewars.com/dashboard')

    visit '/bookmarks'
    expect(page).to have_content('https://www.bbc.co.uk/news')
    expect(page).to have_content('https://www.google.com/')
    expect(page).to have_content('https://www.codewars.com/dashboard')
  end
end
