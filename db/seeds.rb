# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Pet.create(name: "Fluffy", animal_type: "Lion", breed: "African Lion", age: 12, home_stay: true, take_away: true, adoptable: true, user_id: 1)
Pet.create(name: "Melinda", animal_type: "Unicorn", breed: "Rainbow", age: 9, take_away: true, user_id: 2)
Pet.create(name: "Rico", animal_type: "Snake", breed: "Python", age: 20, take_away: true, home_stay: true, adoptable: true, user_id: 1)
Pet.create(name: "Sir Bartholomew III", animal_type: "Dog", breed: "Cocker Spaniel", age: 6, home_stay: true, user_id: 1)
Pet.create(name: "Mr Sniffles", animal_type: "Bunny", age: 2, home_stay: true, adoptable: true, user_id: 2)
Pet.create(name: "Robert Rubby", animal_type: "Duck", age: 1, home_stay: true, user_id: 1)
Pet.create(name: "Ginger", animal_type: "Cat", age: 7, home_stay: true, take_away: true, user_id: 2)
Pet.create(name: "Kinkaid", animal_type: "Dog", breed: "Golden Retriever", age: 3, home_stay: true, take_away: true, user_id: 1)

Booking.create(pet_id: 2, user_id: 2, start_date: 20180106, end_date: 20180202 )
Booking.create(pet_id: 5, user_id: 1, start_date: 20180105, end_date: 20180202 )
Booking.create(pet_id: 6, user_id: 2, start_date: 20180104, end_date: 20180202 )
