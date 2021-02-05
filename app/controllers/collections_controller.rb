class CollectionsController < ApplicationController
    #CRUD CREATE READ UPDATE DESTROY

    def create
        @book = Book.new(book_params)

        if @book.save

            redirect_to('book_collection/index')
        else 
            render('new')
        end
        javascript_tag(alert('Added Book'))
        
    end
    
    def new
        @book = Book.new
    end

    def show
        @book = Book.find(params[:id]) 
    end

    def index
        @books = Book.order('price ASC')
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to(collection_path(@book))
        else
            render('edit')
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def delete
        @book = Book.find(params[:id])
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to(collections_path)
        
    end

private

    def book_params
      params.require(:book).permit(:title, :author, :genre, :price, :published_date)
    end

end
