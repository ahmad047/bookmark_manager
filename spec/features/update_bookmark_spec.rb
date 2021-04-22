feature 'update bookmarks' do
  scenario 'alows user to update bookmarks' do
    BookmarkManager.create(title: 'google', url: 'https://www.google.com/')
    bookmark_id = BookmarkManager.list_all.first.id
    visit '/bookmarks'

    click_button("google_update")
    expect(current_path).to eq "/bookmarks/#{bookmark_id}/update"

    fill_in "url", with: "https://www.not_google.com/"
    fill_in "title", with: "not_google"
    click_button "Submit"

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('google', href: 'https://www.google.com/')
    expect(page).to have_link('not_google', href: 'https://www.not_google.com/')
  end
end
