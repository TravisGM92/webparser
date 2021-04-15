class AllSupplements
  def self.conn
    html = URI.open("https://www.bulksupplements.com/pages/products-a-z")
    Nokogiri::HTML(html)
  end

  def self.all_products
    result = conn
    items = result.css(".az-list-columns").text.split("\n").map { |item| item.gsub(/\s+/, "")}
    items.select { |item| item.length > 1}
  end
end
