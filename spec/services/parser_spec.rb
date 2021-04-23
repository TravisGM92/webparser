require 'rails_helper'

RSpec.describe 'WebParser' do
  before(:each) do
    @keyword = 'creatine-monohydrate'
  end
   it 'can get info from website' do #This just tests the gems HTTPOK and Net
     url = 'https://www.bulksupplements.com/products/creatine-monohydrate?_pos=1&_sid=07f2a7903&_ss=r'
     uri = URI.parse(url)
     response = Net::HTTP.get_response(uri)
     expect(response).to be_a(Net::HTTPOK)
  end
  # it 'can get the title' do #Tests if class Parser can use method .get_title to have an input (creatine-monohydrate) and spit back it's title
  #   expect(WebParser.get_title(@keyword)).to eq('Creatine Monohydrate Micronized')
  # end
  # it 'can get summary' do #Same ideas as above but for the summary
  #   summary = 'Creatine monohydrate is an organic compound that helps facilitate recycling of ATP in muscle and brain tissue and is found in vertebrates. It was first discovered in 1832 by Michel Eugéne Chevreul, and the first evidence of its benefits on the muscles was found in 1912 by Harvard University researchers. Creatine became available as a dietary supplement in 1993, and since then it has become one of the most widely studied supplements. Creatine is commonly taken by athletes and bodybuilders and has become a staple of workout supplements.'
  #
  #   expect(WebParser.get_summary(@keyword)).to eq(summary)
  # end
  # it 'can get benefits' do
  #   expect(WebParser.get_benefits(@keyword)).to be_an(Array)
  # end
end
