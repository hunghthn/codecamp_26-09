class BooksController < ApplicationController
  def index
    if params[:query].present?
      query = "%#{params[:query]}%"
      @books = Book.where('title LIKE :query OR content LIKE :query', query: query)
    else  
      @books = Book.all
    end

    respond_to do |format|
      format.html
      format.json do
        render json: @books.map { |book| { id: book.id, title: book.title, content: book.content, url: book_path(book) } }
      end
    end
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
  end
end
