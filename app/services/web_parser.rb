class WebParser
  def self.bulk_supplements_products
    agent = Mechanize.new
    agent.get('https://www.bulksupplements.com/pages/products-a-z')
  end


  def self.summary_and_benefits
    results = []
    errors = []
    agent = Mechanize.new
    AllSupplements.only_consumables(all_product_links).each do |link|
      # sleep(1)
      begin
        # page = agent.get(link)
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

  def self.product_info_hash(page)
    product_name = page.title.split('|')[0].strip.delete('â€ ')
    description = page.search('div.product-description p').text.delete('â€ ').delete('†')
    benefits = page.search('div.product-description li').text.delete('â€ ').delete('†').split("\n")
    return {
      title: product_name,
      description: description,
      benefits: benefits
    }
  end
end
