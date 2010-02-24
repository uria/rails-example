require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
#require "authlogic/test_case" # include at the top of test_helper.rb

Before do
  include Authlogic::TestCase
  activate_authlogic
end 

# Given /^there exist users:$/ do |table|
#   table.hashes.each do |hash|
#     Given "there exists a user" 
#   end
# end

Given /^there exists a user:$/ do |table|
  table.hashes.each do |hash|
    h = Hash.new
    h[:username] = hash[:username] || "user"
    h[:password] = hash[:password] || "password"
    h[:password_confirmation] = h[:password]
    h[:email] = hash[:email] || "#{h[:username]}@email.com"
    h[:birthdate] = hash[:birthdate] || 20.years.ago
    h[:county] = County.find_or_create_by_name(hash[:county] || "Sussex")
    h[:city] = hash[:city] || "London"
    h[:gender] = Gender.find_or_create_by_name(hash[:gender] || "Man")
    h[:looking_for] = Gender.find_or_create_by_name(hash[:gender] || "Woman")
    User.create(h)   
  end
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
