require 'rails_helper'

RSpec.describe 'Supplment view page' do
   it 'index page' do
     visit ('/supplements')
     number = (1..402).to_a
     number.each do |num|
       expect(page).to have_css(".supplement-#{num}")
     end
  end
  it 'show page' do
    visit('/supplements')
    click_button('L-Citrulline DL-Malate 2:1 Powder')
    expect(page).to have_css('.category-button')
  end

  it 'show page related supplements buttons' do
    visit('/supplements')
    click_button('L-Citrulline DL-Malate 2:1 Powder')
    # expect page to have every Supplement with 'energy' as a category to show up on this page
    click_button('Energy')
    expect(current_path).to eq('/search')
    expect(page).to have_button('Caffeine Pills')
  end
end
