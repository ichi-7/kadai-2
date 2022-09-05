class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to "/books/#{@book.id}", notice: 'Book was successfully created.'
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    book = Book.find(params[:id])
    book.update(book_params)
    
    if @book.update(book_params)
      redirect_to "/books/#{@book.id}", notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
