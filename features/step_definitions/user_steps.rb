Given /^there is a firefighter named "([^\"]*)"$/ do |name|
  user = Factory(:normal_user,:name=>name,:password => "fire_district",:password_confirmation => "fire_district")
end

Given /^"([^\"]*)" signs in$/ do |name|
  user = User.find_by_name(name)
  Given %{I sign in as "#{user.email}/fire_district"}
end

Given /^I am logged in as a firefighter named "([^\"]*)"$/ do |name|
  Given %Q{there is a firefighter named "#{name}"}
  And %Q{"#{name}" signs in}
end

Given /^I am logged in as a firefighter named "([^\"]*)" who is part of "([^\"]*)"$/ do |name, dept_name|
  Given %Q{there is a department called "#{dept_name}"}
  Given %Q{I am logged in as a firefighter named "#{name}"}
  user = User.find_by_name(name)
  dept = Department.find_by_name(dept_name)
  user.department = dept
  user.save!
end

Given /^"([^\"]*)" is subscribed to messages for "([^\"]*)"$/ do |name, station_name|
  Factory(:subscription,:user=>User.find_by_name(name),:station=>Station.find_by_name(station_name))
end

Given /^there is a firefighter named "([^\"]*)" who is subscribed to messages for "([^\"]*)"$/ do |name, station_name|
  Given %Q{there is a firefighter named "#{name}"}
  And %Q{"#{name}" is subscribed to messages for "#{station_name}"}
  @notifiee = User.find_by_name(name)
end

Given /^I am logged in as a firefighter named "([^\"]*)" who is a publisher for "([^\"]*)"$/ do |name, station_name|
  Given %Q{there is a firefighter named "#{name}"}
  And %Q{"#{name}" is subscribed to messages for "#{station_name}"}
  And %Q{"#{name}" signs in}
  @user = User.find_by_name(name)
end

Given /^"([^\"]*)" has no subscriptions$/ do |name|
  user = User.find_by_name(name)
  user.subscriptions.delete_all
end

Given /^there is a firefighter named "([^\"]*)" who has no subscriptions"$/ do |name|
  Given %Q{there is a firefighter named "#{name}"}
  And %Q{"#{name}" has no subscriptions}
end

Then /^I should have (\d+) subscription(?:s)?$/ do |count|
  page.should have_css(".station_notifier", :count => count)
end