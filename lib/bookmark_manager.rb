# frozen_string_literal: true

require 'pg'
require 'database_connection'

class BookmarkManager
  attr_reader :id, :url, :title

  def initialize(id:, title:, url:)
    @id = id
    @url = url
    @title = title
  end

  def self.list_all
    result = DatabaseConnection.query('SELECT * FROM bookmarks;')
    result.map { |bookmark| BookmarkManager.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title']) }
  end

  def self.create(url:, title:)
    DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}')")
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  def self.update(id:, title:, url:)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
  end


  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    BookmarkManager.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

end
