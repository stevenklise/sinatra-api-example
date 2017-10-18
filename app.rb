# Require the bundler gem and then call Bundler.require to load in all gems
# listed in Gemfile.
require 'bundler'
Bundler.require

configure do
  set :root, File.dirname('name')
end

# Models
require_relative 'models'
# Routes
require_relative 'routes'
