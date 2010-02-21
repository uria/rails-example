require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
#require "authlogic/test_case" # include at the top of test_helper.rb

Before do
  include Authlogic::TestCase
  activate_authlogic
end 

Given /^there exist users:$/ do |table|
  table.hashes.each do |hash|
    h = Hash.new_user_path
    h[:username] = hash[:username] || "user"
    h[:password] = hash[:password] || "password"
    h[:password_confirmation] = h[:password]
    h[:email] = hash[:email] || "#{h[:username]}@email.com"
    User.create(h)    
  end
end

Given /^there exists a user:$/ do |table|
  hash = table.hashes[0]
  h = Hash.new
  h[:username] = hash[:username] || "user"
  h[:password] = hash[:password] || "password"
  h[:password_confirmation] = h[:password]
  h[:email] = hash[:email] || "#{h[:username]}@email.com"
  User.create(h)
end

When /^I log in as:$/ do |table|
  hash = table.hashes[0]
  hash[:password] = "password" if hash[:password].nil?
  When "I go to login"
  When "I fill in \"Username\" with \"#{hash[:username]}\""
  When "I fill in \"Password\" with \"#{hash[:password]}\""
  When 'I press "Log-in"'  
end

Given /^I am logged in as:$/ do |table|
  Given "there exists a user:", table
  When "I log in as:", table
end

Then /what/ do
  puts @response.body.gsub("\n", "\n            ")
end
