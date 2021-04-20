# frozen_string_literal: true

feature 'shows Bookmarks page' do
  scenario 'it visits /bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'shows bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'https://www.bbc.co.uk/news');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.google.com/');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.codewars.com/dashboard');")

    visit '/bookmarks'
    expect(page).to have_content('https://www.bbc.co.uk/news')
    expect(page).to have_content('https://www.google.com/')
    expect(page).to have_content('https://www.codewars.com/dashboard')
  end
end
