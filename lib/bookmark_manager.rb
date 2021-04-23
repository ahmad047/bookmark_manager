# frozen_string_literal: true

require 'pg'
require_relative './database_connection'
require 'uri'

class BookmarkManager
  attr_reader :id, :url, :title

  def initialize(id:, title:, url:)
    @id = id
    @url = url
    @title = title
    # @comments = comments.map { |comment| comment[:text]}
  end

  def comments
    result = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{@id};")
    result.map { |com| com['text'] }
  end


  def self.list_all
    
    result = DatabaseConnection.query('SELECT * FROM bookmarks;')
    result.map { |bookmark| BookmarkManager.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title']) }
  end

  def self.create(url:, title:)
    return false unless is_url?(url)
    DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}')")
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  def self.update(id:, title:, url:)
    return false unless is_url?(url)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
  end


  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    BookmarkManager.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.add_comment(id:, comment:)
    DatabaseConnection.query("INSERT INTO comments (bookmark_id, text) VALUES('#{id}', '#{comment}')")
  end
  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
