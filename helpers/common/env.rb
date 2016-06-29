
require 'calabash-cucumber/cucumber'
require_relative './helper.rb'
require 'calabash-cucumber/wait_helpers'
require 'calabash-cucumber/operations'
World(Calabash::Cucumber::Operations)

TIMEOUT = 5
