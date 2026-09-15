require 'rails_helper'

RSpec.describe "user_books/show", type: :view do
  let(:user_book) do
    user = User.create!(username: "alice")
    book = Book.create!(name: "Dune", details: "A science fiction novel")
    UserBook.create!(user: user, book: book)
  end

  before(:each) do
    assign(:users, [ user_book.user ])
    assign(:books, [ user_book.book ])
    assign(:user_book, user_book)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include(user_book.user.username)
    expect(rendered).to include(user_book.book.name)
  end
end
