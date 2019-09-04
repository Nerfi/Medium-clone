require 'faker'

puts "creating articles"
10.times do
  article = Article.new(
     title: Faker::FunnyName.name_with_initial,
        description: Faker::Lorem.paragraph_by_chars
    )
    article.save!
  end
  puts 'done'
