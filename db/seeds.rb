# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = {}
user["password"] = '123456'

ActiveRecord::Base.transaction do
    10.times do 
        user['first_name'] = Faker::Name.first_name
        user['last_name'] = Faker::Name.last_name
        user['email'] = Faker::Internet.email
        
        User.create(user)
    end
end

listing = {}
uids = []
User.all.each { |u|  uids << u.id}

ActiveRecord::Base.transaction do
    30.times do 
        listing['name'] = Faker::App.name
        listing['description'] = Faker::Hipster.sentence
        listing['address'] = Faker::Address.full_address
        listing['price'] = rand(50..300)
        listing['rating'] = rand(0..5)
        listing['bed_room_type'] = ["Studio", "House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Others"].sample
        listing['bed_room_num'] = rand(1..3)
        listing['bed_type'] = ["Single", "Queen Size", "King Size", "Bunk Bed", "No Bed"].sample
        listing['bed_num'] = rand(1..3)
        listing['bathroom_type'] = ["Private", "Shared"].sample
        listing['bathroom_num'] = rand(1..2)

        listing['user_id'] = uids.sample
    end
end