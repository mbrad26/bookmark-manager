require 'pg'

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit '/'

    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'A user can see bookmarks' do
    Bookmark.create(url: "http://www.makersacademy.com")
    Bookmark.create(url: "http://www.destroyallsoftware.com")
    Bookmark.create(url: "http://www.google.com")

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
