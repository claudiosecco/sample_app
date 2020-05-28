# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
(6th Edition)
by [Michael Hartl](https://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. 

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
$ yarn install --check-files
```

Create a .env file in app's root directory and fill in your gmail credentials:

```
NOREPLY_GMAIL_USERNAME=
NOREPLY_GMAIL_PASSWORD=
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Deployment info

This app was made counting on Heroku deployment.

Before pushing to Heroku, find `# MAILER CONFIG` in config/environments/production.rb and change line bellow:

```
host = '<your app>.herokuapp.com'
```

Standard Heroku steps:

```
$ heroku create
$ git push heroku master
$ heroku run rails db:migrate
```

Set environment variables with your AWS S3 and Gmail credentials:

```
$ heroku config:set AWS_ACCESS_KEY_ID=
$ heroku config:set AWS_SECRET_ACCESS_KEY=
$ heroku config:set AWS_REGION=
$ heroku config:set AWS_BUCKET=
$ heroku config:set GMAIL_USERNAME=
$ heroku config:set GMAIL_PASSWORD=
```

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).
