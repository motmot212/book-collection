require "rails_helper"

RSpec.describe Book, type: :model do
    #test for price
    it "has a price attribute" do
      book = Book.new(
        name: "Dune",
        details: "A science fiction novel.",
        price: 19.99
      )

      expect(book.price).to eq(19.99)
    end
  

  #test for author
  it "has an author attribute" do
    book = Book.new(
      name: "Dune",
      details: "A science fiction novel.",
      author: "Frank Herbert"
    )

    expect(book.author).to eq("Frank Herbert")
  end

  #test for published-date (Date/DateTime)
  it "has a published_date attribute" do
    published_date = Date.new(1965, 8, 1)
    book = Book.new(
      name: "Dune",
      details: "A science fiction novel.",
      published_date: published_date
    )

    expect(book.published_date).to eq(published_date)
  end
end

