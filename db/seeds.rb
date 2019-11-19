# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

all = Category.find_or_create_by(title: 'All')

groceries = Category.find_or_create_by(title: 'Groceries', category: all)

# CARS

cars = Category.find_or_create_by(title: 'Cars', category: all)

petrol_cars = Category.find_or_create_by(title: 'Petrol', category: cars)
electric_cars = Category.find_or_create_by(title: 'Electric', category: cars)

tesla = Category.find_or_create_by(title: 'Tesla', category: electric_cars)

opel = Category.find_or_create_by(title: 'Opel', category: petrol_cars)
mercedes = Category.find_or_create_by(title: 'Mercedes', category: petrol_cars)

# MOBILE PHONES

mobile_phones = Category.find_or_create_by(title: 'Mobile phones', category: all)

apple = Category.find_or_create_by(title: 'Apple', category: mobile_phones)
iphone = Category.find_or_create_by(title: 'iPhone', category: apple)

nokia = Category.find_or_create_by(title: 'Nokia', category: mobile_phones)

# CUSTOM FIELDS

CustomField.find_or_create_by(title: 'name', type: STRING, category: all)
