require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am not logged in$/ do
end

Then /^I should see a link to "([^\"]*)"$/ do |text|
  response.should have_selector("a", :content => text)
end

Then /^I should see an? "([^\"]*)" field$/ do |label|
  field_labeled(label).should_not be_nil
end

Then /^I should see a radio button with name "([^\"]*)"$/ do |label|
  response.should have_selector("input", :type => 'radio', :name => label)
end

Then /^I should see an? "([^\"]*)" button$/ do |label|
  response.should have_selector("input", :type => 'submit', :value => label)
end

Then /^I should see a user menu for "([^\"]*)"$/ do |username|
  response.should have_selector("div#user-menu") do |um|
    um.should contain(username)
    um.should contain("Logout")
  end
end

Then /^I should see an error saying "([^\"]*)"$/ do |msg|
  response.should have_selector("p", :content => msg)
end

Then /^I should see a notice saying "([^\"]*)"$/ do |msg|
  response.should have_selector("p.flash.notice", :content => msg)
end

Then /^I should see an error notice saying "([^\"]*)"$/ do |msg|
  response.should have_selector("p.flash.error", :content => msg)
end

When /^I register as:$/ do |table|
  hash = table.hashes[0]
  When 'I go to new user'
  When "I fill in \"Username\" with \"#{hash[:username]}\""
  When "I fill in \"Password\" with \"#{hash[:password]}\""
  When "I fill in \"Password confirmation\" with \"#{hash[:password_confirmation]}\""
  When "I fill in \"Email Address\" with \"#{hash[:email]}\""
  When "I select \"#{hash[:birthdate]}\" as the date"
  When "I select \"#{hash[:county]}\" from \"County\""
  When "I fill in \"City\" with \"#{hash[:city]}\""
  if hash[:gender] =~ /man/i
    choose 'user_gender_id_1'
  else
    choose 'user_gender_id_2'
  end
  if hash[:looking_fo] =~ /man/i
    choose 'user_looking_for_id_1'
  else
    choose 'user_looking_for_id_2'
  end
  
  When 'I press "Register"'
end
