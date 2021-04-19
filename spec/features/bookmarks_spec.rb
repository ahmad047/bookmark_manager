feature 'shows Bookmarks page' do
  scenario 'it visits /bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('Bookmarks')
  end

  scenario 'shows bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('https://www.bbc.co.uk/news')
    expect(page).to have_content('https://www.google.com/')
    expect(page).to have_content('https://www.codewars.com/dashboard')
  end

end
