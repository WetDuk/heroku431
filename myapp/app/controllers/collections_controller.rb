class CollectionsController < ApplicationController
    #CRUD CREATE READ UPDATE DESTROY

    def create
        @book = Book.new(book_params)

        if @book.save
            redirect_to(collections_path)
            flash.alert = "Created Book."

        else 
            render('new')
        end        
    end
    
    def new
        @book = Book.new
    end

    def show
        @book = Book.find(params[:id]) 
        flash.alert = "Showed Book."

    end

    def index
        @books = Book.order('price ASC')
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to(collections_path)
            flash.alert = "Edited Book."

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
        flash.alert = "Deleted Book."
    end

private

    def book_params
      params.require(:book).permit(:title, :author, :genre, :price, :published_date)
    end

end
