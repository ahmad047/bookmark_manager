# frozen_string_literal: true
require 'pg'

class BookmarkManager
  def self.list_all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end
end
