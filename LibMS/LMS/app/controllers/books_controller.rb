class BooksController < ApplicationController
def new
@book = Book.new
end

def index
  @books = Book.paginate(page: params[:page])
 # @user = User.find(params[:id])
end

def create
  @book = Book.new(book_params)
  @book.save
  redirect_to @book
end

def show
  @book= Book.find(params[:id])
end

def search
  @books = Book.search(params[:q])
end

def view
  @book = Book.find(params[:id])
end

def destroy
  @book = Book.find(params[:id])
  if current_user.user_type == "user"
    @book.destroy
    flash[:success] = "Book deleted"
    redirect_to books_url
  else
    flash[:success] = "Admin Permission required."
    redirect_to login_url
  end
end

private

def book_params
  params.require(:book).permit(:id, :title, :description,
                               :status, :created_at, :updated_at,
                               :author1, :author2, :author3,
                               :author4, :author5)
end



end
