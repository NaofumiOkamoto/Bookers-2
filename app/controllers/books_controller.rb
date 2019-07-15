class BooksController < ApplicationController

  def create
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
     render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
    @books = Book.all
  end

  def show
    @book = Book.new
    @users = User.all
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user
    if @user.id != current_user.id 
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
