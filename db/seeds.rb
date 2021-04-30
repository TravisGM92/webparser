# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
Supplement.delete_all
summary_and_benefits = WebParser.summary_and_benefits
summary_and_benefits.each do |item|
  supplement = Supplement.find_or_create_by(title: item[:title]) do |supp|
    supp.summary = item[:description] || 'no summary'
  end
  Supplement.add_benefit_categories(item[:benefits], supplement)
end
