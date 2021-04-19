# frozen_string_literal: true

require 'bookmark_manager'

describe BookmarkManager do
  it 'has :list_all class method' do
    expect(described_class).to respond_to(:list_all)
  end
end
