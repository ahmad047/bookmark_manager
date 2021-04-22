feature 'delete bookmarks' do
  scenario 'page has a button to delete bookmarks' do
    create_test_bookmarks
    visit '/'
    click_button 'google_delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('google', href: 'https://www.google.com/')
  end
end
