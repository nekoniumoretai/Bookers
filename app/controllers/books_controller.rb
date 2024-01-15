class BooksController < ApplicationController

  def create
    @new_book = Book.new(book_params)
    if @new_book.save
      flash[:notice] = "Your post was submitted successfully"
      redirect_to book_path(@new_book.id)
    else
      @books = Book.all
      flash.now[:notice]
      render :index
    end
  end

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
       flash[:notice] = "Update was completed successfully"
      redirect_to book_path(book.id)
    else
      @book = Book.find(params[:id])
      flash.now[:notice]
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Delection was completed successfully"
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
 end
