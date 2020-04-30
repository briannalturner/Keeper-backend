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
Room.destroy_all

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
    if (character["name"].split(" ")[0] === character["name"].split(" ")[-1])
        firstName = character["name"].split(" ")[0]
        lastName = ""
    else
        firstName = character["name"].split(" ")[0]
        lastName = character["name"].split(" ")[-1]
    end


    User.create!(
        first_name: firstName,
        last_name: lastName,
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
    user2 = users.sample
    Like.create!(liker: user2, likee: user)
    Like.create!(liker: user, likee: user2)
    user3 = users.sample
    Like.create!(liker: user3, likee: user)
    Like.create!(liker: user, likee: user3)
    room1 = Room.create!(user_one: user, user_two: user2)
    room2 = Room.create!(user_one: user3, user_two: user)
    RoomMessage.create!(room: room1, user: user, message: "Are you sure you’re a muggle cause I’d swear that ass is magical!")
    RoomMessage.create!(room: room1, user: user2, message: "Wanna go manage some mischief together? I solemnly swear I’m up to no good.")
    RoomMessage.create!(room: room2, user: user, message: "Are you sure you’re not a Dementor? Because I’m sure I’d die if you kissed me.")
    RoomMessage.create!(room: room2, user: user3, message: "Did you order some Felix Felicis? Cause you’re about to get lucky!")
}

# byebug
# 0