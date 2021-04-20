# frozen_string_literal: true

require 'bookmark_manager'

describe BookmarkManager do
  it 'has :list_all class method' do
    expect(described_class).to respond_to(:list_all)
  end

  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.bbc.co.uk/news');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.google.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.codewars.com/dashboard');")

    bookmarks = BookmarkManager.list_all

    expect(bookmarks).to include 'https://www.bbc.co.uk/news'
    expect(bookmarks).to include 'https://www.bbc.co.uk/news'
    expect(bookmarks).to include 'https://www.codewars.com/dashboard'
  end
end
