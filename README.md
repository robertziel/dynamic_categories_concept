# Dynamic Categories Example BACKEND

Frontend repository: https://github.com/robertziel/dynamic_categories_concept_client_react

## About API

* Grape API: `/api`
* Swagger documentation: `/api/docs`

## Category

One category can have multiple custom fields.
If category is assigned to parent category, it will inherit custom fields from parent.

## Custom fields

Are always assigned to one category.
There are following custom fields types:

* Boolean
* Integer
* String

And much more can be added if required.

## Item

This is what we try to find while using this app.
One can have different custom fields depending on category is assigned to.

There are a few basic fields that each item has:

* name
* description
* price

## ENV
`CORS_ALLOWED_ORIGINS` - if empty `localhost:3000` is used as default

## Set up locally

1. Make sure you have proper **ruby** version installed, defined in [.ruby-version](.ruby-version)

2. And **PostgreSQL** running

3. Then:
  ```
  bundle install
  rake db:create
  rake db:migrate
  rails s -p 8080
  ```

4. Your app should be available in `localhost:8080`

## Before commit

1. Set up **overcommit** to make sure your code is clean :) :

  ```
  gem install overcommit
  bundle install --gemfile=.overgems.rb
  overcommit --install
  ```

2. Make sure elint is installed, just run:
  ```
  npm install
  ```

3. Then you can commit your changes!
