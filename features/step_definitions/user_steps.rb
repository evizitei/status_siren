Given /^there is a firefighter named "([^\"]*)"$/ do |name|
  Factory(:normal_user,:name=>name,:password => "fire_district",:password_confirmation => "fire_district")
end

Given /^I am logged in as a firefighter named "([^\"]*)"$/ do |name|
  Given %Q{there is a firefighter named "#{name}"}
  user = User.find_by_name(name)
  Given %{I sign in as "#{user.email}/fire_district"}
end

Given /^there is a firefighter named "([^\"]*)" who is subscribed to messages for "([^\"]*)"$/ do |name, station_name|
  Given %Q{there is a firefighter named "#{name}"}
  @notifiee = User.find_by_name(name)
  station = Station.find_by_name(station_name)
  Factory(:subscription,:user=>@notifiee,:station=>station)
end