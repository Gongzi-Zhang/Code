# commands
> rails console [rails c]
    An interface to interact (check) data
> rails db:migrate
> rails db:rollback
    undo a migration
> rails destroy [rails d]
    exact opposite of generate
> rails generate [rails g]
    Generator
> rails server [rails s]
> rails test [rails t]

> bundle install [bundle]
# how to
> rails new project
> cd project
> Config Gemfile
> bundle install --path vendor/bundle
> bundle update
> rails db:migrate
> rails test
> rails server

# MVC (Model-View-Controller)
1. Rails analyze the URL, find corresponding anction in config/routes.rb
2. The action ask data from the Model.
3. The Model pulls data from the database
4. The Model returns the data to the Controller
5. The Controller passes the data to View
6. The View use embedded Ruby to render the page as HTML
7. The Controller passes the HTML back to the browser
