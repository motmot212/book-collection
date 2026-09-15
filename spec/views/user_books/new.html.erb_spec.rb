require 'rails_helper'

RSpec.describe "user_books/new", type: :view do
  before(:each) do
    user = User.create!(username: "alice")
    book = Book.create!(name: "Dune", details: "A science fiction novel")
    assign(:users, [ user ])
    assign(:books, [ book ])
    assign(:user_book, UserBook.new(
      user: user,
      book: book
    ))
  end

  it "renders new user_book form" do
    render

    assert_select "form[action=?][method=?]", user_books_path, "post" do

      assert_select "select[name=?]", "user_book[user_id]"

      assert_select "select[name=?]", "user_book[book_id]"
    end
  end
end
