class BooksController < ApplicationController
  def new
    @book = Book.new

  end

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
    if @book.save
   redirect_to book_path(@book.id), success: "book was successfully create."
    else
      @books =Book.page(params[:page])
      @user = current_user
     render :index
    end
 end


  def index
    @books =Book.page(params[:page])
    @user = current_user
    @book = Book.new
  end

  def show
    @book =Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
  end

  def edit
      @book= Book.find(params[:id])
      @user= current_user
  end

  def update
    @book =Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), success: "Book was successfully updated."
    else
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
