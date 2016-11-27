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
For the first time push, run the following command:
```
heroku git:remote -a csc444
```
To deploy to Heroku and update database:
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
* Run all RSpec tests
```
rake spec
```
* Test the account registration/login:
```
rspec spec/features/account_spec.rb
```
If the testing fails due to any Factory Girl or Database issues, try the following commands:
```
bin/rails db:environment:set RAILS_ENV=test
bundle exec rake db:drop RAILS_ENV=test
bundle exec rake db:create RAILS_ENV=test
bundle exec rake db:schema:load RAILS_ENV=test
```
Make sure to switch back to development mode:
```
bin/rails db:environment:set RAILS_ENV=development
```
###Troubleshooting
If you receive the error when upload the picture:
```
This image Failed to manipulate with MiniMagick, maybe it is not an image? Original Error: ImageMagick/GraphicsMagick is not installed
```
For Mac, please run:
```
brew install graphicsmagick
```
