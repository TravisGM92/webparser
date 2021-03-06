class Supplement < ApplicationRecord
  validates_presence_of :title, :summary
  has_many :categories
  accepts_nested_attributes_for :categories

  def self.add_benefit_categories(benefits, supplement)
    if benefits.class == Array
      benefits.each do |bulk_benefit|
        categories.each do |key, value|
          key.each do |our_benefit|
            if bulk_benefit.downcase.include?(our_benefit.downcase)
              supplement.categories.find_or_create_by!(keyword: value)
            end
          end
        end
      end
    else
      add_benefit_categories_from_string(benefits, supplement)
    end
  end

  def self.add_benefit_categories_from_string(benefits, supplement)
    categories.each do |key, value|
      key.each do |our_benefit|
        if our_benefit == 'sleep' && benefits.downcase.include?(our_benefit.downcase)
          if !supplement.title.downcase.include?('caffeine')
            supplement.categories.find_or_create_by!(keyword: value)
          end
        elsif benefits.downcase.include?(our_benefit.downcase)
          supplement.categories.find_or_create_by!(keyword: value)
        end
      end
    end
  end

  def self.related_supplements(keyword)
    Supplement.joins(:categories).where(categories: {keyword: keyword})
  end

  private

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
      ['mood support', 'healthy mood'] => 'mood',
      ['increased appetite'] => 'appetite increaser',
      ['sexual'] => 'sexual health',
      ['respiratory'] => 'respiratory',
      ['bones'] => 'bone strength',
      ['joint'] => 'joint strength',
      ['sleep'] => 'sleep health'
    }
  end
end
