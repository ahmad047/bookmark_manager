# frozen_string_literal: true

class BookmarkManager
  @list = [
    'https://www.bbc.co.uk/news',
    'https://www.google.com/', '
    https://www.codewars.com/dashboard'
  ]

  def self.list_all
    @list
  end
end
