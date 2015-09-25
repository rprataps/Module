class Book < ActiveRecord::Base
  has_many :checkouts
  has_many :users, through: :checkouts
  validates :id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :status, presence: true

  def self.search(query)
    key = "%#{query}%"
    @books = Book.where('title LIKE :search OR id LIKE :search OR description LIKE :search', search: key).order(:title)
  end

  def self.checks_check (id)
    checkouts = Checkout.where( books_id: id)
  end

end
