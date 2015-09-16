# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@teamblog.com", password: "hard_to_guess_pass", is_admin: true)
Article.create(title: "Markdown sample", contents: File.read(Rails.root.join("vendor", "assets", "article_samples", "markdown_example")))
Article.first.comments.create(body: "meaningful comment")
Comment.first.comments.create(body: "a small iteration of the meaningful comment")

User.create(email: "user@teamblog.com", password: "hard_to_guess_pass", is_admin: false)

2.times do |i|
  User.create(email: "user"+i.to_s+"@mail.com", password: "password123")
end

50.times do |a|
  Article.create(title: "Sample article #{a}", contents: Faker::Lorem.paragraph)
end
