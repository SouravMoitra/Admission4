# Admission 4

[![Code Climate](https://codeclimate.com/github/SouravMoitra/Admission4/badges/gpa.svg)](https://codeclimate.com/github/SouravMoitra/Admission4)

By [Sourav Moitra](https://facebook.com/sourav.moitra)

## License

The software is license under [MIT License](http://opensource.org/licenses/MIT)

## Introduction

This is a ruby on rails application its purpose is to help colleges in West Bengal,
India to implement online admission.

## Technical Details

* Ruby version 2.1.3
* Rails version 4.1.6
* Dependecies
  * Production `postgresql`
  * Development `Mysql`

## Setup

After deploying this application in server start rails console

```bash
  $ rails console
```
or from if deployed in heroku

```bash
  $ heroku run rails console
```
The site can be administerd by openin "/admin"

and signin with email: "admin@example.com" and password: "password"
and Verifier a user using the following command

```ruby
  > User.create(email: "your@email.com", password: "password", password_confirmation: "confirmation", verifier: true)
```

The above command creates verifier user with email: 'your@email.com'
and password: password. Verfier can manually verify documents of the candidate and just mark it verified afterwards

After this has been setup the candidates can fill up their details

## Author
Original Author Sourav Moitra
