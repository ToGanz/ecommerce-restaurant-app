# Ecommerce-Restaurant-App

Ecommerce app in Ruby on Rails.
* Ruby version: 3.0.1

* Rails: 6.1.3.1

Live Site: [https://tobis-foods.herokuapp.com/]
(free plan so first load might take a few seconds)


![image](https://user-images.githubusercontent.com/49613341/118952482-49ba2d80-b95c-11eb-8b1c-ce9edf23f091.png)


This is an ecommerce app for an imagenary restaurant. Users can browse and filter the menu, add items to the cart and checkout via credit card. The payment is done via  Stripe checkout. It is still in test mode so no real payment gets made. 
To make a test payment use:
* Number: 4242 4242 4242 4242
* CVC: any 3 digits
* Date: any future data


### Menu
![image](https://user-images.githubusercontent.com/49613341/118978977-416feb80-b978-11eb-90b4-b7984ccf1462.png)


The app includes admin functionality. The admin can create product categories and products with images. Images get stored with AWS S3. Orders made by customers can be watched and marked as delivered.
To test the app as an admin use:
* admin@example.com
* password123


### Admin handling of orders
![image](https://user-images.githubusercontent.com/49613341/118979078-606e7d80-b978-11eb-8bbb-5c673bb2b8b6.png)

Technologies used: 
* Ruby on Rails 6.1
* postgresql
* Bootstrap 5
* RSpec/Capybara for tests
* Devise for authentication
* Stripe API for payment
* AWS S3 for image storage
* Heroku for hosting


I built this app to practice authentication with devise and to practice making external API calls within rails.

## Run the app locally

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install 
```

Next, migrate the database:

```
$ rails db:migrate
```

You will need your own Stripe API Keys.

Finally, run the test suite to verify that everything is working correctly:

```
$ rspec
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```


## Todo's:
* Payment with Stripe does not have an automated test yet
* Orders overview for the admin can be improved with filterting for paid/delivered/canceled orders