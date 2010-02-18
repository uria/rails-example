require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am not logged in$/ do
end

Then /^I should see a link to "([^\"]*)"$/ do |text|
  response.should have_selector("a", :content => text)
end

Then /^I should see an? "([^\"]*)" field$/ do |label|
  field_labeled(label).should_not be_nil
end

Then /^I should see an? "([^\"]*)" button$/ do |label|
  response.should have_selector("input", :type => 'submit', :value => label)
end

Given /^there is a user named "([^\"]*)" with password "([^\"]*)" and email "([^\"]*)"$/ do |username, password, email|
  User.create(:username => username, :password => password, :password_confirmation => password, :email => email)
end

Then /^I should see a user menu for "([^\"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see an error saying "([^\"]*)"$/ do |msg|
  response.should have_selector("p", :content => msg)
end

Then /^I should see a notice saying "([^\"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
