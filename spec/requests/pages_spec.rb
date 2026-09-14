require "rails_helper"

RSpec.describe "Pages", type: :request do
  it "gets the home page" do
    get root_path

    expect(response).to have_http_status(:ok)
  end

  it "gets the add page" do
    get add_path

    expect(response).to have_http_status(:ok)
  end

  it "gets the update page" do
    get update_path

    expect(response).to have_http_status(:ok)
  end

  it "gets the details page" do
    get details_path

    expect(response).to have_http_status(:ok)
  end

  it "gets the delete page" do
    get delete_path

    expect(response).to have_http_status(:ok)
  end

  it "shows a notice after adding a book" do
    post add_path, params: { book: { name: "Dune", details: "A science fiction novel" } }
    get root_path

    expect(response.body).to include("Book was added successfully.")
  end

  it "shows a notice after updating a book" do
    Book.create!(name: "Dune", details: "Original details")

    patch update_path, params: { book: { details: "Updated details" } }
    get root_path

    expect(response.body).to include("Book was updated successfully.")
  end

  it "shows a notice after deleting a book" do
    Book.create!(name: "Dune", details: "A science fiction novel")

    delete delete_path
    get root_path

    expect(response.body).to include("Book was deleted successfully.")
  end

  it "asks for confirmation before deleting a book" do
    Book.create!(name: "Dune", details: "A science fiction novel")

    get delete_path

    expect(response.body).to include("Are you sure you want to delete this book?")
  end
end
