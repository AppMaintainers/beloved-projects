# Beloved Projects
An application where users are able to see different projects uploaded by others, also give give feedback by commenting or reviewing them.
#### Built With
- [Ruby on Rails](https://rubyonrails.org/) - Core framework
- [PostgreSQL](https://www.postgresql.org/) - Used for development database
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

## Testing

For test purposes we're using the followings:
* [RSpec](https://github.com/rspec/rspec-rails)
* [FactoryBot](https://github.com/thoughtbot/factory_bot_rails)
* [Faker](https://github.com/faker-ruby/faker)
* [RuboCop](https://github.com/rubocop/rubocop-rails)

## Deployment
On your local machine, you can run the server by running:
```bash
bundle install
rails s
```
There are two separated environment on Heroku: a [staging](https://staging.beloved-projects.herokuapp.com) and a [production](https://app.beloved-projects.herokuapp.com) environment. These are in progress right now.