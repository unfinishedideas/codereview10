# Product Town Store
##### (Code Review 10)

## Purpose
This app acts as kind of a review aggregate site for various products. Users can add, remove and edit products as well as contribute reviews with ratings.

## Installation
* Install Ruby 2.5.7 on your machine
* Install SQL 12.1 with Postgres on your machine
* Clone the git repository at _https://github.com/unfinishedideas/codereview10.git_
* Navigate to folder and run Bundle install from terminal
* In terminal navigate to the folder and run `rake db:create` to create the database
* Next run `rake db:migrate` to get the tables created
* Optionally run `rake db:seed` to generate a series of random values for products and reviews
* Finally `rails s` to start the server and navigate to __localhost:3000__ on your browser to open the application

## Known Bugs


## Support and contact
If you have any issues viewing this site or any general questions about it please email me at
_PeteTheBeatWells@gmail.com_

## Technologies Used
**Ruby 2.5.7**  
_for back-end business logic and functionality_

**SQL Postrgres (12.1)**  
_for database management_

**Sinatra**  
_for pathing {GET, POST, PATCH, DELETE}_

 **HTML**  
 _for page construction_

 **CSS**  
_for general styling_

### License
Copyright (c) 2020 Peter Wells  
Licensed under the GPL license.

_Last updated 1/17/2020_
