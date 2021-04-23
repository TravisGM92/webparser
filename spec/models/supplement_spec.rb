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
    it 'add_benefit_categories()' do
      # keyword = 'creatine-monohydrate'
      # supp = Supplement.create!(title: WebParser.get_title(keyword), summary: WebParser.get_summary(keyword))
      # expect(supp.categories).to be_empty
      # Supplement.add_benefit_categories(keyword, supp)
      # expect(supp.categories).to_not be_empty
      # expect(supp.categories.count).to eq(4)
      # expected_benefits = ['muscle mass', 'weight gain', 'anaerobic strength', 'nootropic']
      # expected_benefits.each do |benefit|
      #   expect(supp.categories.pluck(:keyword).include?(benefit)).to be_truthy
      # end
    end
  end
end
