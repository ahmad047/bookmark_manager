# frozen_string_literal: true

require 'bookmark_manager'

describe BookmarkManager do
  it 'has :list_all class method' do
    expect(described_class).to respond_to(:list_all)
  end

  it 'creates a new bookmark instance with title and url' do
    bookmark = BookmarkManager.new(title: "test", url: "https://test.com")
    expect(bookmark.title).to eq 'test'
    expect(bookmark.url).to eq 'https://test.com'
  end

  it 'returns a list of bookmarks' do
    BookmarkManager.create(title: 'bbc', url: 'https://www.bbc.co.uk/news')
    BookmarkManager.create(title: 'google', url: 'https://www.google.com/')
    BookmarkManager.create(title: 'codewars', url: 'https://www.codewars.com/dashboard')

    bookmarks = BookmarkManager.list_all

    expect(bookmarks.length).to eq 3
    expect(bookmarks[0].url).to eq 'https://www.bbc.co.uk/news'
    expect(bookmarks[0].title).to eq 'bbc'
    # expect(bookmarks).to include 'https://www.bbc.co.uk/news'
    # expect(bookmarks).to include 'https://www.codewars.com/dashboard'
  end

  describe '.create' do
    it 'creates a new bookmark' do
      BookmarkManager.create(title: 'test', url: 'http://www.testbookmark.com')

      expect(BookmarkManager.list_all.length).to eq 1
    end
  end

end
