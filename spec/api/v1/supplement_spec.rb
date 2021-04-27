require 'rails_helper'

RSpec.describe 'Supplement API call' do
  describe 'REST endpoints' do
    describe 'supplements' do
      it 'can get all supplements' do
        supplements = create_list(:supplement, 5)
        supplements[0..3].each do |supp|
          supp.categories.find_or_create_by(keyword: 'energy')
        end
        supplements[4..5].each do |supp|
          supp.categories.find_or_create_by(keyword: 'nootropic')
        end

        get '/api/v1/supplements'
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json.keys).to eq([:data])
        expect(json[:data].length).to eq(5)
        json[:data].each do |supplement|
          expect(supplement.keys).to eq(%i[id type attributes])
          expect(supplement[:type]).to eq('supplement')
          expect(supplement[:attributes].keys).to eq(%i[title summary categories])
          supplement[:attributes][:categories].each do |category|
            expect(category[:supplement_id]).to eq(supplement[:id].to_i)
            expect(category[:keyword]).to be_a(String)
          end
        end
      end
      it 'can get one supplement' do
        supplement = create(:supplement)
        categories = %w[creatine beta-alanine]
        categories.each { |category| supplement.categories.create!(keyword: category) }

        get "/api/v1/supplements/#{supplement.id}"
        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json.keys).to eq([:data])
        expect(json[:data][:type]).to eq('supplement')
        expect(json[:data][:id].to_i).to eq(supplement.id)
        expect(json[:data][:attributes].keys).to eq(%i[title summary categories])
      end
    end
  end
end
