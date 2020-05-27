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

## Non standard deployment steps

Set AWS S3 environment variables:

```
$ heroku config:set AWS_ACCESS_KEY_ID=
$ heroku config:set AWS_SECRET_ACCESS_KEY=
$ heroku config:set AWS_REGION
$ heroku config:set AWS_BUCKET
```

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).
