class Book < ApplicationRecord
  validates :name, presence: true

  has_many :user_books, dependent: :destroy
  has_many :users, through: :user_books
end