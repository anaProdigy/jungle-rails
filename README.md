# Jungle E-commerce Application

Jungle is a captivating e-commerce application built with Rails 6.1, tailored for plant enthusiasts and gardeners. While the foundation is based on a [template](https://github.com/lighthouse-labs/jungle-rails), I've taken the initiative to enhance it with a plethora of features, culminating in a seamless and delightful online shopping experience. Jungle emerges as the definitive platform for all aspects related to plants and gardening.

## Features

- Engaging and convenient online shopping experience.
- Wide variety of plants available for purchase.
- Thoughtfully designed interface for both seasoned gardeners and beginners.
- Implementation of additional features beyond the template to enrich user experience.

## Final Product
![website demonstration](jungle.gif)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
