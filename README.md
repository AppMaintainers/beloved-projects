# Beloved Projects
An application to manage projects within a team.
## Getting Started
These instructions will give you a copy of the project up and running on your local machine for development and testing purposes.
### Prerequisites
Make sure you have installed all of the following prerequisites on your development machine:
#### Linux or macOS
1. Get [asdf-vm](https://asdf-vm.com/#/core-manage-asdf)
2. Install required plugins
    ```bash
    asdf plugin add ruby
    asdf plugin add nodejs
    asdf plugin add yarn
    asdf plugin add sqlite
    ```
3. Install tools
   ```bash
   asdf install
   ```
#### Windows
1. Install Ruby with [RubyInstaller](https://rubyinstaller.org/downloads/archives/). (Note: you need a Ruby+Devkit installer) (3.0.2)
2. Install [NodeJs](https://nodejs.org/en/download/releases/) (16.13.0)
3. Install yarn with `npm install -g yarn` (1.22.17)
### Installing
After installing the [Prerequisites](#prerequisites), you need to

1. Install all dependencies
    ```bash
    bundle install
    yarn install
    ```
2. Create the database
    ```bash
    rails db:setup
    ```
3. Finally start your local development server
    ```bash
    rails s
    ```
4. Optionally you can run webpacker dev server to speed up asset handling
    ```bash
    bin/webpack-dev-server
    ```
   or
   ```cmd
   ruby bin/webpack-dev-server
   ```
   on Windows

## Running the tests

For automated tests, we are using Rails' defaults

### End to end tests

You can run the test suit with `rails test`

### Coding style checks
For basic test setup, we use [RSpec](https://github.com/rspec/rspec-rails), [FactoryBot](https://github.com/thoughtbot/factory_bot_rails), [Faker](https://github.com/faker-ruby/faker) and [RuboCop](https://github.com/rubocop/rubocop-rails)

## Deployment

### Staging environment
staging.beloved-projects.herokuapp.com (not done yet)
### Production environment
app.beloved-projects.herokuapp.com (not done yet)
## Built With

- [Ruby on Rails](https://rubyonrails.org/) - Core framework
- [PostgreSQL](https://www.postgresql.org/) - Used for development database