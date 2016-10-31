# Golf Tournament Organizer

##Please notify the team when changed Gemfile

The Github repo for CSC444 Project

####Run Server on Localhost:
```
bundle install --without production
rake db:migrate
rails server
```
####Push to Heroku
```
git push heroku master
heroku run rake db:migrate
```
###Database
* Local Database: SQLite3
* Heroku: PostgresSQL

###Pages
* Home: https://csc444.herokuapp.com/
* Login: https://csc444.herokuapp.com/accounts/sign_in
* Signup: https://csc444.herokuapp.com/accounts/sign_up

###Test
* Test the account registration/login:
```
rspec spec/features/account_spec.rb
```
