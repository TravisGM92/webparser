class Supplement < ApplicationRecord
  validates_presence_of :title, :summary
  has_many :categories

  def self.add_benefit_categories(keyword, supplement)
    supplement_benefits = WebParser.get_benefits(keyword)
    supplement_benefits.each do |bulk_benefit|
      categories.each do |key, value|
        key.each do |our_benefit|
          if bulk_benefit.include?(our_benefit)
            supplement.categories.find_or_create_by(keyword: value)
          end
        end
      end
    end
  end

  def self.categories
    {
      ['increased muscle mass'] => 'muscle mass',
      ['muscle mass'] => 'muscle mass',
      ['weight gain'] => 'weight gain',
      ['anaerobic strength'] => 'anaerobic strength',
      ['brain', 'cognitive', 'focus', 'mental', 'memory'] => 'nootropic',
      ['energy'] => 'energy',
      ['endurance'] => 'endurance',
      ['exercise performance', 'performance'] => 'exercise performance',
      ['overall health', 'overall wellness'] => 'overall health',
      ['antioxidant'] => 'antioxidant',
      ['digestive'] => 'digestive health',
      ['heart', 'cardiovascular'] => 'heart health',
      ['hair'] => 'hair health',
      ['skin'] => 'skin health',
      ['immune', 'immunity'] => 'immunity boost',
      ['healthy weight'] => 'weight maintenace',
      ['circulatory system'] => 'blood flow',
      ['mood support'] => 'mood',
      ['increased appetite'] => 'appetite increaser',
      ['sexual'] => 'sexual health',
      ['respiratory'] => 'respiratory',
      ['bones'] => 'bone strength',
      ['joint'] => 'joint strength'
    }
  end
end
