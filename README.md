# Golfi Web
As golfers ourselves, we know how difficult it is to connect with local golfing communities and join golf tournaments for suitable skill levels. We also understand the frustration of tournament organizers to advertise and manage their tournaments efficiently.

Therefore, we designed Golfi, a free website providing simple yet powerful tools for creating, joining, managing, and sponsoring golf tournaments.

<img src="http://i.imgur.com/ihp9c2T.jpg" width="900">

### Technologies
This web appllication is developed using Ruby on Rails, the app uses SQLite3 database on localhost and PostgreSQL on Heroku  

####Run Golfi on Localhost:
```
bundle install --without production
rake db:migrate
rails server
```
####Push to Heroku
For the first time push, run the following command:
```
heroku git:remote -a <Your Heroku App Name>
```
To deploy to Heroku and update database:
```
git push heroku master
heroku run rake db:migrate
```
###Development Team
* Anqi Wu
* YiZheng Yang
* Yuxuan Zhang
* Yanrong Wang
* Newton Lam
* Tuo Zhang
