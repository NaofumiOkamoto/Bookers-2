class UsersController < ApplicationController


  def top
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    # 上は、@books = Book.where(user_id: @user.id)と同じ意味
    # has_manyで.booksのメソッドが使えるようになる。
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully"
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
