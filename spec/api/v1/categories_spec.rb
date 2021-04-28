require 'rails_helper'

RSpec.describe 'Category API' do
   describe 'REST endpoints' do
     it 'can get all categories' do
       categories = create_list(:category, 10)
       get '/api/v1/categories'
       expect(response).to be_successful
       json = JSON.parse(response.body, symbolize_names: true)
       expect(json[:data].length).to eq(10)
     end
  end
end
