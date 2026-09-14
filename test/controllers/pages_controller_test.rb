require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get add" do
    get pages_add_url
    assert_response :success
  end

  test "should get update" do
    get pages_update_url
    assert_response :success
  end

  test "should get details" do
    get pages_details_url
    assert_response :success
  end

  test "should get delete" do
    get pages_delete_url
    assert_response :success
  end

  test "adding a book shows a notice" do
    post pages_add_url, params: { book: { name: "Dune", details: "A science fiction novel" } }

    follow_redirect!
    assert_select "[role=status]", text: "Book was added successfully."
  end

  test "updating a book shows a notice" do
    Book.create!(name: "Dune", details: "Original details")

    patch pages_update_url, params: { book: { details: "Updated details" } }

    follow_redirect!
    assert_select "[role=status]", text: "Book was updated successfully."
  end

  test "deleting a book shows a notice" do
    Book.create!(name: "Dune", details: "A science fiction novel")

    delete pages_delete_url

    follow_redirect!
    assert_select "[role=status]", text: "Book was deleted successfully."
  end

  test "delete page asks for confirmation" do
    Book.create!(name: "Dune", details: "A science fiction novel")

    get pages_delete_url

    assert_select "p", text: "Are you sure you want to delete this book?"
  end
end
