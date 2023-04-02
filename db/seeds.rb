# creating users
(0..10).each do
  User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: "1", password: "password", username: Faker::Internet.username)
end

# creating a list of categories
Category.create(name: "JavaScript")
Category.create(name: "HTML")
Category.create(name: "CSS")
Category.create(name: "Ruby on Rails")
Category.create(name: "Angular")

# create blogs

# - a category
# - a user
# - blog info

(0..100).each do |i|
  faker_title = Faker::Hacker.noun.capitalize + " " + Faker::Hacker.verb.capitalize
  fake_sub_title = Faker::Lorem.sentence
  num_paragraphs = rand(1..5)
  paragraphs = ""
  num_paragraphs.times do
    paragraphs += Faker::Lorem.paragraph(sentence_count: 3) + "\n\n"
  end

  blog = Blog.new(user_id: rand(1..10), title: faker_title, sub_title: fake_sub_title, content: paragraphs, image_path: "https://www.searchenginejournal.com/wp-content/uploads/2022/06/image-search-1600-x-840-px-62c6dc4ff1eee-sej.png")

  blog.categories = Category.all.sample(rand(1..7))
  blog.save
end
