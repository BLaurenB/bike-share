ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'bundler'
bundler.require(:default, :test)
require 'database_cleaner'

Capybara.app = BikeShareApp

RSpec.configure do |c|
  c.include Capybara::DSL
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
