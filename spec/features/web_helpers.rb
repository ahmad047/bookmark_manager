def create_test_bookmarks
  BookmarkManager.create(title: 'bbc', url: 'https://www.bbc.co.uk/news')
  BookmarkManager.create(title: 'google', url: 'https://www.google.com/')
  BookmarkManager.create(title: 'codewars', url: 'https://www.codewars.com/dashboard')
end
