require 'rails_helper'

RSpec.describe 'collections' do 
    it 'collections creates new books and flashes to the user' do
        visit('collections/index')
        expect(page).to have_content('Book Collection')
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
end