feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a bookmark' do
      BookmarkManager.create(url: 'http://www.google.com', title: 'google')
      bookmark = BookmarkManager.list_all[0]
      visit '/bookmarks'
      click_button 'google_Add Comment'
      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"
      fill_in 'comment', with: 'This is a test comment on this bookmark'
      click_button 'Submit'

      expect(current_path).to eq '/bookmarks'
      expect(page).to have_content 'This is a test comment on this bookmark'
    end
  end
end