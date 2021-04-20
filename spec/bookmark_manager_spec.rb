# frozen_string_literal: true

require 'bookmark_manager'

describe BookmarkManager do
  it 'has :list_all class method' do
    expect(described_class).to respond_to(:list_all)
  end

  it 'returns a list of bookmarks' do
    BookmarkManager.create(url: 'https://www.bbc.co.uk/news')
    BookmarkManager.create(url: 'https://www.google.com/')
    BookmarkManager.create(url: 'https://www.codewars.com/dashboard')

    bookmarks = BookmarkManager.list_all

    expect(bookmarks).to include 'https://www.bbc.co.uk/news'
    expect(bookmarks).to include 'https://www.bbc.co.uk/news'
    expect(bookmarks).to include 'https://www.codewars.com/dashboard'
  end
end
