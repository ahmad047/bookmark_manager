# frozen_string_literal: true

require 'pg'

class BookmarkManager
  attr_reader :url, :title

  def initialize(title:, url:)
    @url = url
    @title = title
  end

  def self.list_all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| BookmarkManager.new(url: bookmark['url'], title: bookmark['title']) }
  end

  def self.create(url:, title:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end

                 connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}')")
  end
end
