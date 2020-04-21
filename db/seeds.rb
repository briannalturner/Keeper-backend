require 'rest-client'
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Like.destroy_all
Message.destroy_all

key = '$2a$10$wklcGoUJPej.gAu.F0jQwehCv1X/4Xv6ok4BK4vQRYOxIC1rnnkLi'
characters = RestClient.get "https://www.potterapi.com/v1/characters?key=#{key}"
char_array = JSON.parse(characters)
years = [1,2,3,4,5,6,7]
genders = ["male", "female"]
orientations = ["straight", "gay", "bisexual", "pansexual", "questioning"]
birthyears = [1990,1991,1992,1993,1994,1995,1996,1997,1998,1999]
booleans = [true, false]
acebooleans = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true]

char_array.each { |character|
    User.create!(
        first_name: character["name"].split(" ")[0],
        last_name: character["name"].split(" ")[-1],
        bio: Faker::Movies::HarryPotter.quote,
        email: "#{character["name"].split(" ")[0].downcase}@gmail.com",
        year: years.sample,
        house: character["house"],
        gender: genders.sample,
        orientation: orientations.sample,
        birthdate: DateTime.new(birthyears.sample,1,1),
        likes_women: booleans.sample,
        likes_men: booleans.sample,
        likes_other: booleans.sample,
        asexual: acebooleans.sample,
        favorite_spell: Faker::Movies::HarryPotter.spell,
        username: character["name"].split(" ")[0].downcase,
        password: "hi"
    )
}

users = User.all
users.each { |user|
    Like.create!(liker: users.sample, likee: user)
    Like.create!(liker: user, likee: users.sample)
}

# byebug
# 0