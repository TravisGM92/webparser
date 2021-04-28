class SupplementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :summary
  attribute :categories do |data|
    data.categories.each do |cat|
      supplement_categories_hash(cat)
    end
  end

  def self.supplement_categories_hash(category)
    {
      'id': category.id,
      'benefit': category.keyword
    }
  end

end
