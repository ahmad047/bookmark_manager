# frozen_string_literal: true

feature 'title' do
  scenario 'the front page has a title of bookmark manager' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end
