require "rails_helper"

RSpec.describe Book, type: :model do
  it "creates a book with a name and details" do
    book = Book.create(
      name: "Dune",
      details: "A science fiction novel."
    )

    expect(book).to be_persisted
    expect(book.name).to eq("Dune")
    expect(book.details).to eq("A science fiction novel.")
  end
end