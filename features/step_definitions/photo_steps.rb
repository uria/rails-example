require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

When /^I upload photo "([^\"]*)"$/ do |file|
  When "I go to photos"
  When "I follow \"Add new photo\""
  When "I attach the file \"#{file}\" to \"photo\""
  When "I press \"Upload\""
end

Given /^I have uploaded (\d+) photos?$/ do |number|
  number.to_i.times do 
    When "I upload photo \"features/file-uploads/image.jpg\""
  end
end

Then /^I should see (\d+) thumbnail photos?$/ do |number|
  response.should have_tag('img.thumbnail.photo', :count => number.to_i)
end


