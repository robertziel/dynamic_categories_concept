# Dynamic Categories Example BACKEND

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

2. Then you can commit your changes!
