require 'rails_helper'

RSpec.describe 'AllSupplements' do
  describe 'methods' do
    it '.all_products' do
      expect(AllSupplements.all_products.length).to eq(474)
      # Total of ALL products, not just supplements
    end
    it '.only_consumables' do
      expect(AllSupplements.only_consumables).to eq(300)
    end
  end
end
