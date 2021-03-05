require 'rails_helper'

RSpec.describe 'collections' do 
    it 'displays the name of the app' do
        visit('collections/index')
        expect(page).to have_content('Book Collection')
    end
end