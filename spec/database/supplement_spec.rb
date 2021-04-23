require 'rails_helper'

RSpec.describe Supplement, type: :model do
  describe 'after seeding database' do
    it 'should have Supplements' do
      expect(Supplement.count).to eq(403)
    end
    it 'supplements should have categories' do
      expect(Supplement.first.categories).to_not be_empty
      expect(Supplement.last.categories).to_not be_empty
      expect(Supplement.last.title).to eq('Zinc Oxide Powder')
    end
  end
end
