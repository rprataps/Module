class CheckoutController < ApplicationController
  def checkout_book
    book = Book.find_by(params[:id])
    book.update(status: 'N')

    checkout = Checkout.new()

  end
end


