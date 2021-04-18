require 'rails_helper'

RSpec.describe 'Supplment view page' do
   it 'can do' do
     visit ('/supplements')
     save_and_open_page
     expect(page).to have_content('creatine')
  end
end
