require 'rails_helper'

RSpec.describe Supplement, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :summary }
  end
  describe 'relationships' do
    it { should have_many :categories }
  end
  describe 'methods' do
    it 'self.add_benefit_categories()' do

      supp = Supplement.create!(title: 'TEST-Creatine', summary: 'The stuff to take')
      benefits = ['increased muscle mass', 'cognitive function', 'plus overall health']
      expect(supp.categories).to be_empty
      Supplement.add_benefit_categories(benefits, supp)

      expect(supp.categories.count).to eq(3)
      expected_benefits = ['muscle mass', 'nootropic', 'overall health']
      expected_benefits.each do |benefit|
        expect(supp.categories.pluck(:keyword).include?(benefit)).to be_truthy
      end
    end
  end
end
