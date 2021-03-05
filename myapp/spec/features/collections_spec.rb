require 'rails_helper'

RSpec.describe 'collections' do
    it 'Displays the collection of books to the user' do
        visit('collections/index')
        expect(page).to have_content('Book Collection')
        expect(page).to have_content('Add')
        expect(page).to have_content('Previous Action:')
        expect(page).to have_content('Author')
        expect(page).to have_content('Genre')
        expect(page).to have_content('Price')
        expect(page).to have_content('Published')
        expect(page).to have_content('Date')
    end
     
    it 'collections creates new books and flashes to the user' do
        visit('collections/index')
   
        click_link('Add')
        expect(current_path).to eql('/collections/new')
        expect(page).to have_content('Create Book')

        fill_in('book_title', :with => 'Terry')
        fill_in('book_author', :with => 'PTerry')
        fill_in('book_genre', :with => 'Fiction')
        fill_in('book_price', :with => '25.00')
        fill_in('book_published_date', :with => 'March 25 2000')
        click_on('Create')
        expect(current_path).to eql('/collections')
        # flash message
        expect(page).to have_content('Previous Action: Created Book.')
    end

    it 'collections creates new books and flashes to the user' do
        visit('collections/index')
   
        click_link('Add')
        expect(current_path).to eql('/collections/new')
        expect(page).to have_content('Create Book')

        fill_in('book_title', :with => 'The Adventures of Jonathan')
        fill_in('book_author', :with => 'Dokota Rocherdson')
        fill_in('book_genre', :with => 'Fiction')
        fill_in('book_price', :with => '25.99')
        fill_in('book_published_date', :with => 'April 12 2010')
        click_on('Create')
        expect(current_path).to eql('/collections')
        # flash message
        expect(page).to have_content('Previous Action: Created Book.')
    end

    it 'collections creates new books and flashes to the user' do
        visit('collections/index')
   
        click_link('Add')
        expect(current_path).to eql('/collections/new')
        expect(page).to have_content('Create Book')

        dbl = double('book', :title => 'No More Monkey Business', :author => 'Gorgelia Hamilton', :genre => 'Tragedy', :price => '45.98', :published_date => 'May 9 1997')
        fill_in('book_title', :with => dbl.title)
        fill_in('book_author', :with => dbl.author)
        fill_in('book_genre', :with => dbl.genre)
        fill_in('book_price', :with => dbl.price)
        fill_in('book_published_date', :with => dbl.published_date)
        click_on('Create')
        expect(current_path).to eql('/collections')
        # flash message
        expect(page).to have_content('Previous Action: Created Book.')
    end
end