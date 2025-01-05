# JOT

_Jot_ is a "bare bones" note taking application written in Ruby on Rails. It
intentionally excludes a lot of the typical features of note taking apps to
keep things simple and occupy a very lightweight footprint. The app is developed
on Ruby on Rails framework.

## Quick Start - Using a _jot_ development container
The quickest way to setup and run _jot_ is to build and deploy a _jot_
development container.

Using podman, or docker, build and deploy the _jot-dev_ image
```
podman build -f Containerfile.dev -t jot-dev
podman run -d --name jot-dev -it -p 3001:3000 -v `pwd`:/app jot-dev
podman exec -it jot-dev bash
```
Open a terminal in the development container.
```
podman exec -it jot-dev bash
```
Once in the development container, run the server in `development` mode.
```
cd /app
bin/rails server -b '0.0.0.0'
```
Access the app via your browser at `localhost:3001`.

## Running _Jot_ in a local development environment.

Note: These instructions aren't likely complete, but give a high level overview of how to run _Jot_ in a local development environment.

### 1. Install Ruby 
Ensure the correct version of Ruby is installed on your system. Check the required version in the project's `.ruby-version` or `Gemfile`.

Use a Ruby version manager like [rbenv](https://github.com/rbenv/rbenv) or [RVM](https://rvm.io/) to install and manage Ruby versions, e.g.,
```
rbenv install <version> rbenv local <version>
```    
### 2. Install Bundler

Bundler is used to manage the project's Ruby gems. Install it if it's not already installed:
```
gem install bundler
```
### 3. Install Gem Dependencies

Run the following command to install all the gems required by the application:
```
bundle install
```
### 4. Set Up Database

If the application uses a database, you'll need to set it up:
```
rails db:create rails db:migrate
```
### 5. Start the Rails Server

To startup the server in `development` mode, run
```
bin/rails server
```
Access the app via your browser at `localhost:3000`.