# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

To add a user as admin. 

-> rails console
in rails consile
->u=User.create(fname: "harry", lname: "potter", email:"harry.potter@example.com",username: "harry_potter")
-> u.save
make a note of the id of the created user

enter the id if user created in user_id
->admin=Credential.create(userType: "admin", username:"harry_potter", password:"harrypotter", user_id: 13) 


admin:
username: harry_potter
Password: harrypotter