class Checkout < ActiveRecord::Base
  belongs_to :users
  belongs_to :books

  def self.checkoutque (id)
    checkouts = Book.where( id: id)
  end

  def self.checkoutbookque (id)
    checkouts = User.where( id: id)
  end
end
