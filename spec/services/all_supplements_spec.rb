require 'rails_helper'

RSpec.describe 'AllSupplements' do
  describe 'methods' do
    it '.only_consumables()' do
      agent = Mechanize.new
      bulk_supplements_products = agent.get('https://www.bulksupplements.com/pages/products-a-z')
      links = []
      site = 'https://www.bulksupplements.com'
      bulk_supplements_products.links.each do |link|
        link.href[0..4] == '/prod' ? links.append(site + link.href) : next
      end
      expect(links.length).to eq(648)
      only_consumables = AllSupplements.only_consumables(links)

      expect(only_consumables.length).to eq(632)
      non_consumable_keywords = %w(card gift machine T-Shirt t-shirt shirt Empty scale tank bottle)

      only_consumables.each do |item|
        expect(non_consumable_keywords.any? { |keyword| item.downcase == keyword }).to be_falsy
      end
    end
  end
end
