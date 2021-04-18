require 'rails_helper'

RSpec.describe 'AllSupplements' do
  describe 'methods' do
    it '.all_products' do
      expect(AllSupplements.all_products.length).to eq(474)
      # Total of ALL products, not just supplements
    end
    it '.only_consumables' do
      results = AllSupplements.only_consumables
      expect(results.length).to eq(462)
      non_consumable_keywords = ['card', 'gift', 'machine', 'T-Shirt', 't-shirt', 'shirt', 'Empty', 'scale', 'tank', 'bottle']
      results.each do |item|
        expect(non_consumable_keywords.any? { |keyword| item.downcase == keyword }).to be_falsy
      end
    end
  end
end
