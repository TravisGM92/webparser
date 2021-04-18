class AllSupplements
  def self.conn
    html = URI.open("https://www.bulksupplements.com/pages/products-a-z")
    Nokogiri::HTML(html)
  end

  def self.all_products
    result = conn
    items = result.css(".az-list-columns").text.split("\n").map { |item| item.strip }
    items.select { |item| item.length > 1}
  end

  def self.non_consumable_keywords
    ['card', 'gift', 'machine', 'T-Shirt', 't-shirt', 'shirt', 'Empty', 'scale', 'tank', 'bottle']
  end

  def self.only_consumables
    all_products.select do |item|
      !non_consumable_keywords.any? { |keyword| item.downcase.include?(keyword)}
    end
  end
end
