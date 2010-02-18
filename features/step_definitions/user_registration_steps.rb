require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am not logged in$/ do
end

Then /^I should see a link to "([^\"]*)"$/ do |text|
  response.should have_selector("a", :content => text)
end

Then /^I should see an? "([^\"]*)" field$/ do |label|
  field_labeled(label).should_not be_nil
end