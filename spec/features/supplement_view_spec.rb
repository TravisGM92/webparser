require 'rails_helper'

RSpec.describe 'Supplment view page' do
   it 'can do' do
     visit ('/supplements')
     number = (1..402).to_a
     number.each do |num|
       expect(page).to have_css(".supplement-#{num}")
     end
  end
end
