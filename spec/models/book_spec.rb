require "rails_helper"

RSpec.describe Book, type: :model do

  # Sunny-day test
  it "can delete a book when a book exists" do
    book = Book.create(
      name: "The Hobbit",
      details: "A fantasy novel about Bilbo Baggins."
    )

    expect {
      book.destroy
    }.to change(Book, :count).by(-1)
  end

  # Rainy-day test
  it "does not cause an error when trying to delete with no books" do
    Book.delete_all

    expect {
      book = Book.order(created_at: :desc).first
      book.destroy if book
    }.not_to raise_error

    expect(Book.count).to eq(0)
  end

  # second rainy day test
  it "does not cause an error when trying to save a book with a title blank" do
    book = Book.new(
      name: "",
      details: "A book with no title."
    )

    expect(book.save).to be_falsey
    expect(book.errors[:name]).to include("can't be blank")
  end
  

end