require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it {should validate_presence_of :keyword }
  end
  describe 'relationships' do
    it { should belong_to :supplement }
  end
end
