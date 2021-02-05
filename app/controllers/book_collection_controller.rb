class BookCollectionsController < ApplicationController
    #CRUD CREATE READ UPDATE DESTROY

    def create
        @book = Book.new(book_params)

        if @book.save

            redirect_to('book_collection/index')
        else 
            render('new')
        end
    end
    
    def new
        @book = Book.new
    end

    def show
        @book = Book.find(params[{'id' => 'index'}])
    end

    def index
        @books = Book.order('price ASC')
    end

    def update
    end

    def edit
    end

    def delete
    end

    def destroy
    end
end
