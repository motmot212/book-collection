class PagesController < ApplicationController
  def home
    @books = Book.all
  end

  def add
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path
    else
      render :add, status: :unprocessable_entity
    end
  end

  def update
    @book = Book.order(created_at: :desc).first
  end

  def update_book
    @book = Book.order(created_at: :desc).first

    if @book && @book.update(details: params[:book][:details])
      redirect_to details_path
    else
      redirect_to update_path
    end
  end

  def details
    @book = Book.order(created_at: :desc).first
  end

  def delete
    @book = Book.order(created_at: :desc).first
  end

  def destroy
    @book = Book.order(created_at: :desc).first

    if @book
      @book.destroy
    end

    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :details)
  end
end
