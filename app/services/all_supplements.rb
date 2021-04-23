class AllSupplements
  def self.conn
    html = URI.open("https://www.bulksupplements.com/pages/products-a-z")
    Nokogiri::HTML(html)
  end


  def self.only_consumables(links)
    results = []
    links.each do |link|
      !non_consumable_keywords.any? { |keyword| link.downcase.include?(keyword)} ? results << link : next
    end
    results
  end

  private

  def self.non_consumable_keywords
    %w(gift machine T-Shirt t-shirt shirt Empty scale tank bottle)
  end
end
