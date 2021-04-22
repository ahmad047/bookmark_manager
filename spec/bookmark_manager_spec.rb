# frozen_string_literal: true

require 'bookmark_manager'

describe BookmarkManager do
  it 'has :list_all class method' do
    expect(described_class).to respond_to(:list_all)
  end

  it 'creates a new bookmark instance with title and url' do
    bookmark = BookmarkManager.new(id: 1, title: "test", url: "https://test.com")
    expect(bookmark.title).to eq 'test'
    expect(bookmark.url).to eq 'https://test.com'
    expect(bookmark.id).to eq 1
  end

  it 'returns a list of bookmarks' do
    bookmark = BookmarkManager.create(title: 'bbc', url: 'https://www.bbc.co.uk/news')

    bookmarks = BookmarkManager.list_all

    expect(bookmarks.length).to eq 1
    expect(bookmarks[0].url).to eq 'https://www.bbc.co.uk/news'
    expect(bookmarks[0].title).to eq 'bbc'
  end

  describe '.create' do
    it 'creates a new bookmark' do
      BookmarkManager.create(title: 'test', url: 'http://www.testbookmark.com')

      expect(BookmarkManager.list_all.length).to eq 1
    end
  end

  describe '.delete' do
    it 'delets a new bookmark' do
      BookmarkManager.create(title: 'bbc', url: 'https://www.bbc.co.uk/news')
      id_to_delete = BookmarkManager.list_all[0].id
      BookmarkManager.delete(id: id_to_delete)
      expect(BookmarkManager.list_all).to be_empty
    end
  end
end
