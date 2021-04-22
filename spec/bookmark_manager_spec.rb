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

  describe '.update' do
    it 'updates a bookmark' do
      BookmarkManager.create(title: 'bbc', url: 'https://www.bbc.co.uk/news')
      id_to_update = BookmarkManager.list_all[0].id
      BookmarkManager.update(id: id_to_update, title: 'not_bbc', url: 'www.not_bbc.com')
      expect(BookmarkManager.list_all[0].title).to eq 'not_bbc'
      expect(BookmarkManager.list_all[0].url).to eq 'www.not_bbc.com'

    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      BookmarkManager.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      bookmark = BookmarkManager.list_all[0]
      result = BookmarkManager.find(id: bookmark.id)

      expect(result).to be_a BookmarkManager
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end
end
