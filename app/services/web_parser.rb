class WebParser
  def self.conn(item)
    html = URI.open("https://www.bulksupplements.com/products/#{item}?")
    Nokogiri::HTML(html)
  end

  def self.get_title(item)
    result = ''
    title = conn(item).css("h1").text
    title.tr('^A-Za-z0-9', '').chars.each_with_index do |letter, index|
      (letter == letter.capitalize && index != 0) ? result += " #{letter}" : result += letter
    end
    result
  end

  def self.get_summary(item)
    summary = ''
    description = conn(item).css('.product-description').text.split("\n")
    description.each_with_index { |desc, index| desc.include?('What Is') ? summary += description[index + 1] : next}
    summary
  end

  def self.get_benefits(item)
    benefits = []
    bulleted_benefits = conn(item).css('.product-description ul').text.split("\n").reject { |c| c.empty? }
    bulleted_benefits.each do |benefit|
      benefits << benefit.gsub(/[^0-9a-z ]/i, '')
    end
    benefits
  end
end
