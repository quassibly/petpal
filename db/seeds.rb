User.create(email: "daniel.blake1@hotmail.co.uk", password: "password", name: "Daniel")
User.create(email: "lota@gmail.com", password: "123123", name: "lota")
User.create(email: "kolja.lucht@gmail.com", password: "kolja1234", name: "kolja")
User.create(email: "quassibly@gmail.com", password: "password", name: "meredith")



Pet.create(name: "Fluffy", animal_type: "Lion", breed: "African Lion", age: 12, home_stay: true, take_away: true, adoptable: true, user_id: 1, location: "123 Billy Street, WE3 1RB", remote_photo_url: "http://res.cloudinary.com/novelty142/image/upload/v1527078774/tzoeviyvznngbv3b13ae.jpg")
Pet.create(name: "Melinda", animal_type: "Unicorn", breed: "Rainbow", age: 9, take_away: true, user_id: 4, location: "Rudi-Dutschke-Straße 26, 10969 Berlin", remote_photo_url: "http://res.cloudinary.com/novelty142/image/upload/v1527086929/bxpb3z9u4no5yofesl7w.jpg")
Pet.create(name: "Rico", animal_type: "Snake", breed: "Python", age: 20, take_away: true, home_stay: true, adoptable: true, user_id: 1, location:"Potsdamer Straße 188, 10827 Berlin", remote_photo_url: "http://res.cloudinary.com/novelty142/image/upload/v1527079953/mkcpposkwwzlxld4ol4w.jpg")
Pet.create(name: "Sir Bartholomew III", animal_type: "Dog", breed: "Cocker Spaniel", age: 6, home_stay: true, user_id: 1, location: "Zimmerstraße 23, 10969 Berlin", remote_photo_url: "http://res.cloudinary.com/novelty142/image/upload/v1527080582/pzwmysdalbs2ukjnzbbi.jpg")
Pet.create(name: "Mr Sniffles", animal_type: "Bunny", age: 2, home_stay: true, adoptable: true, user_id: 2, location: "Köpenicker Str. 126, 10179 Berlin", remote_photo_url: "http://res.cloudinary.com/novelty142/image/upload/v1527086680/rodxmrmf3ed2atm7qy25.jpg")
Pet.create(name: "Robert Rubby", animal_type: "Duck", age: 1, home_stay: true, user_id: 1, location: "Unter den Linden 10, 10117 Berlin", remote_photo_url: "http://res.cloudinary.com/novelty142/image/upload/v1527078833/hbkgdxjzr4bwzsi6ba5g.jpg")
Pet.create(name: "Ginger", animal_type: "Cat", age: 7, home_stay: true, take_away: true, user_id: 4, location: "Am Nordbahnhof 3, 10115 Berlin", remote_photo_url: "http://res.cloudinary.com/novelty142/image/upload/v1527086953/acz0fjbsvhnf3l0is1wa.jpg")
Pet.create(name: "Kinkaid", animal_type: "Dog", breed: "Golden Retriever", age: 3, home_stay: true, take_away: true, user_id: 1, location:"Linienstraße 130, 10115 Berlin", remote_photo_url: "http://res.cloudinary.com/novelty142/image/upload/v1527080564/a0lskfz9nnjyfib6oeah.jpg")
Pet.create(name: "Milly", animal_type: "Snail", age: 2, home_stay: true, user_id: 3,location: "10965 Berlin", remote_photo_url: "http://res.cloudinary.com/novelty142/image/upload/v1527086805/mza9s2tuzzhlpcfiwgi7.jpg")
Pet.create(name: "Poppa", animal_type: "Pony", breed: "Iceland Pony", age: 4, home_stay: true, user_id:3, location: "Mollstraße 1, 10178 Berlin", remote_photo_url: "http://res.cloudinary.com/novelty142/image/upload/v1527087012/efqmq8rybzea5ga09l3g.jpg")

Booking.create(pet_id: 2, user_id: 1, start_date: 20180106, end_date: 20180202 )
Booking.create(pet_id: 5, user_id: 1, start_date: 20180105, end_date: 20180202 )
Booking.create(pet_id: 6, user_id: 2, start_date: 20180104, end_date: 20180202 )
Booking.create(pet_id: 9, user_id: 4, start_date: 20180106, end_date: 20180202 )
Booking.create(pet_id: 1, user_id: 3, start_date: 20180106, end_date: 20180202 )
