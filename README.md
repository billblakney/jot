# JOT

_Jot_ is a "bare bones" note taking application written in Ruby on Rails. It
intentionally excludes a lot of the typical features of note taking apps to
keep things simple and occupy a very lightweight footprint. The app is developed
on Ruby on Rails framework.

## Quick Start - Using a _jot_ development container
The quickest way to setup and run _jot_ is to build and deploy a _jot_
development container.

### 1. Build the _jot-dev_ image
#### Using docker:
```
cd jot
docker build -f Containerfile.dev -t jot-dev .
docker run -it --name jot-dev -p 3001:3000 -v `pwd`:/app jot-dev
```

#### Using podman
```
cd jot
podman build -f Containerfile.dev -t jot-dev
podman run -it --name jot-dev -p 3001:3000 -v `pwd`:/app jot-dev
```
### 2. Run a _jot-dev_ container
#### Using docker
Open a PowerShell window and enter the development container.
```
docker exec -it jot-dev bash
```
#### Using podman
Open a Linux terminal and enter the development container.
```
podman exec -it jot-dev bash
```
### 3. Start the _jot_ server
Once in the development container, run the server in `development` mode.
```
cd /app
RAILS_ENV=development bin/rails server -b '0.0.0.0'
```
### 3. Access the _Jot_ website
Access the app via your browser at `localhost:3001`.

## Running _Jot_ in a local development environment.

_Note: These instructions are not complete, but they do give a high level
overview of how to run _Jot_ in a local development environment._

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
### 6. Access the _Jot_ website
Access the app via your browser at `localhost:3000`.