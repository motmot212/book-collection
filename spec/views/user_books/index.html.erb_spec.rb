require 'rails_helper'

RSpec.describe "user_books/index", type: :view do
  before(:each) do
    user_one = User.create!(username: "alice")
    user_two = User.create!(username: "bob")
    book_one = Book.create!(name: "Dune", details: "A science fiction novel")
    book_two = Book.create!(name: "The Hobbit", details: "A fantasy novel")
    assign(:users, [ user_one, user_two ])
    assign(:books, [ book_one, book_two ])
    assign(:user_books, [
      UserBook.create!(
        user: user_one,
        book: book_one
      ),
      UserBook.create!(
        user: user_two,
        book: book_two
      )
    ])
  end

  it "renders a list of user_books" do
    render

    assert_select "div#user_books form", count: 2
    assert_select "div#user_books p a", text: "Show this user book", count: 2
  end
end
