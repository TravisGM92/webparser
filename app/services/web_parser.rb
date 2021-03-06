class WebParser

  def self.summary_and_benefits
    results = []
    errors = []
    agent = Mechanize.new
    AllSupplements.only_consumables(all_product_links).each do |link|
      # sleep(1)
      begin
        results << product_info_hash(agent.get(link))
      rescue Mechanize::ResponseCodeError => e
        errors << { error_code: e, link: link }
      end
    end
    return results
  end

  def self.all_product_links
    links = []
    site = 'https://www.bulksupplements.com'
    bulk_supplements_products.links.each do |link|
      link.href[0..4] == '/prod' ? links.append(site + link.href) : next
    end
    links
  end

  private

  def self.bulk_supplements_products
    agent = Mechanize.new
    agent.get('https://www.bulksupplements.com/pages/products-a-z')
  end

  def self.product_info_hash(page)
    results = []
    product_name = page.title.split('|')[0].strip.delete('â€ ')
    description = page.search('div.product-description p').text.delete('â€ ').delete('†')
    benefits = page.search('div.product-description li').text.delete('â€ ').delete('†').split("\n")
    if benefits.empty?
      product_description_and_benefits = page.search('div.product-description').text.split("\n")
      product_description_and_benefits.each_with_index { |string, index| string.downcase.include?('benefits') ? results << product_description_and_benefits[index+1] : next}
      benefits = results.join
    end
    keyword = "— BulkSupplements.com"
    return {
      title: product_name.gsub(keyword, ''),
      description: description,
      benefits: benefits
    }
  end
end
