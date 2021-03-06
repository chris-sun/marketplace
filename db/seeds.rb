# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create 10 users
def add_users
  10.times do |i|
    email = "chrissun+testuser#{i}@gmail.com"
    firstname = FFaker::Name.first_name
    lastname = FFaker::Name.last_name
    description = FFaker::Job.title
    password = "abc#{i}def"
    User.create(email: email,
                firstname: firstname,
                lastname: lastname,
                description: description,
                password: password,
                password_confirmation: password)
  end
end

def add_services
  4
end

add_users if 0 == User.count
add_services if 0 == Service.count

# Create 10 services

