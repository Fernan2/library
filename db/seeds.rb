# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Rails.env.test?
  authors = FactoryGirl.create_list(:author, Random.rand(5..10))
  authors.each { |author| FactoryGirl.create_list(:book, Random.rand(0..5) * Random.rand(0..5), author: author) }
end
Country.find_or_create_by(code: 'es_ES', name: 'España')
Country.find_or_create_by(code: 'en_US', name: 'USA')

puts "Seed done. Authors: #{Author.count}, books: #{Book.count}"
