# Golf Tournament Organizer

The Github repo for CSC444 Project

####Run Server on Localhost:
```
bundle install --without production
rails server
```
####Push to Heroku
```
git push heroku master
heroku run rake db:migrate  /*Migrate remote database*/
```
###Database
* Local Database: SQLite3
* Heroku: PostgresSQL

###Pages
* Login: https://csc444.herokuapp.com/accounts/sign_in
* Signup: https://csc444.herokuapp.com/accounts/sign_up
