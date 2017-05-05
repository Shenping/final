class LibraryController < ApplicationController
  def index
      @book = Book.all
    end
  def new
      @book = Book.new
    end
end
 def create
    @book=Book.new(candidates_params)
    if @book.save
      redirect_to book_path, notice: "新增成功"
    else
      render 'new'
      #redirect_to new_candidates_path
    end
  end
  
  def edit
  end
  
  def update
    @book =find_book()
    
    if @book.update(books_params)
      redirect_to books_path, notice: "更改成功"
    else
      render 'edit'
    end
  end

 def destroy
    @book.destroy
    redirect_book_path, notice:"delete"
  end

 private
  def
    book_params
    params.require("book").permit(:name,:introduction,:actor)
  end
  
end

