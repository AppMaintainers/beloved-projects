# Beloved Projects

An application where users are able to browse different projects uploaded by others, and also give feedback by commenting or reviewing.

#### Built With
- [Ruby on Rails](https://rubyonrails.org/) - Core framework
- [PostgreSQL](https://www.postgresql.org/) - Used for development database

## Getting Started

This is an example of how you may give instructions on setting up your project locally. To get a local copy up and running follow these simple example steps.

### Prerequisites

Make sure you have installed all of the following prerequisites on your development machine:

#### Linux or macOS

1. Get [asdf-vm](https://asdf-vm.com/#/core-manage-asdf)
2. Install required plugins
    ```bash
    asdf plugin add ruby
    asdf plugin add nodejs
    asdf plugin add yarn
    asdf plugin add postgres
    ```
3. Install tools
   ```bash
   asdf install
   ```
4.  NOTE: You may get an error here saying `role <username> does not exist`. If this happens, try the following:
    ```bash
    psql -U postgres
    CREATE ROLE <username> SUPERUSER;
    ALTER ROLE "<username>" WITH LOGIN;
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
2. Start your postgres server by running
    ```bash
    postgres
    ```
3. Create the database
    ```bash
    rails db:setup
    ```
4. Finally start your local development server
    ```bash
    rails s
    ```

## Development

On your local machine, you can run the server by running:

```bash
rails s
```

And you can run the webpack dev server:

```bash
bin/webpacker-dev-server
```

To use SMTP server install:

```bash
gem install mailcatcher
```

And you can run the SMTP server:

```bash
mailcatcher -b
```

## Testing

For testing purposes we're using the followings:
* [RSpec](https://github.com/rspec/rspec-rails)
* [FactoryBot](https://github.com/thoughtbot/factory_bot_rails)
* [Faker](https://github.com/faker-ruby/faker)
* [RuboCop](https://github.com/rubocop/rubocop-rails)
