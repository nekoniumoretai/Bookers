class BooksController < ApplicationController
  
  def new
    @list = Book.new
  end
  
  def create
    list = Book.new(list.params)
    list.save
    redirect_to '/top'

  end
  def index
    @lists = Book.all
  end

  def show
  end

  def edit
  end
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
