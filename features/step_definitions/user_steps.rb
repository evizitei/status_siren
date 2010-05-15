Given /^I am logged in as a firefighter named "([^\"]*)"$/ do |name|
  user = Factory(:normal_user,:name=>name,:password => "fire_district",:password_confirmation => "fire_district")
  Given %{I sign in as "#{user.email}/fire_district"}
end

Given /^there is a firefighter named "([^\"]*)" who is subscribed to messages for "([^\"]*)"$/ do |user_name, station_name|
  Given %Q{there is a firefighter named "#{user_name}"}
  @notifiee = User.find_by_name
  station = Station.find_by_name(station_name)
  Factory(:subscription,:user=>@notifiee,:station=>station)
end