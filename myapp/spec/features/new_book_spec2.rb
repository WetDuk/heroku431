require 'rails_helper'

RSpec.describe 'new_book2' do 
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
end