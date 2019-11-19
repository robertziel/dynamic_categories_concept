# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

all = Category.find_or_create_by(name: 'All')

groceries = Category.find_or_create_by(name: 'Groceries', parent: all)

# CARS

cars = Category.find_or_create_by(name: 'Cars', parent: all)

petrol_cars = Category.find_or_create_by(name: 'Petrol', parent: cars)
electric_cars = Category.find_or_create_by(name: 'Electric', parent: cars)

tesla = Category.find_or_create_by(name: 'Tesla', parent: electric_cars)

opel = Category.find_or_create_by(name: 'Opel', parent: petrol_cars)
mercedes = Category.find_or_create_by(name: 'Mercedes', parent: petrol_cars)

# MOBILE PHONES

mobile_phones = Category.find_or_create_by(name: 'Mobile phones', parent: all)

apple = Category.find_or_create_by(name: 'Apple', parent: mobile_phones)
iphone = Category.find_or_create_by(name: 'iPhone', parent: apple)

nokia = Category.find_or_create_by(name: 'Nokia', parent: mobile_phones)

# CUSTOM FIELDS

CustomField.find_or_create_by(name: 'All have it', datatype: CustomField::STRING, category: all)
