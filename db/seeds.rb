# db/seeds.rb
puts 'Creating users...'
users_attributes = [
  {
  email: "guillaume@gmail.com"
  password: "aaaaaa"
  first_name: "Guillaume"
  last_name: "Kordonian"
  phone_number: "0145678459"
  },
  {
  email: "jeremy@gmail.com"
  password: "aaaaaa"
  first_name: "Jeremy"
  last_name: "Merlot"
  phone_number: "0146378549"
  },
  {
  email: "paula@gmail.com"
  password: "aaaaaa"
  first_name: "Paula"
  last_name: "Vandemeulebroucke"
  phone_number: "0146379670"
  },
  {
  email: "benoit@gmail.com"
  password: "aaaaaa"
  first_name: "Benoit"
  last_name: "Morin"
  phone_number: "0649779956"
  }]

User.create!(users_attributes)
puts 'Finished Users DB seed!'

puts 'Creating bookings...'
users_attributes = [
    {
  date:
  status:
  description:
  },
    {
  date:
  status:
  description:
  },
    {
  date:
  status:
  description:
  },
  {
  date:
  status:
  description:
  }]

User.create!(users_attributes)
puts 'Finished Bookings DB seed!'
