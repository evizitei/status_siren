Given /^there is a department called "([^\"]*)"$/ do |name|
  @department = Factory(:department,:name=>name)
end

Given /^there is a station named "([^\"]*)" in that department$/ do |name|
  @station = Factory(:station,:name=>name,:department=>@department)
end

Given /^there is a firefighter named "([^\"]*)" who is subscribed to messages for "([^\"]*)"$/ do |user_name, station_name|
  @notifiee = Factory(:user,:name=>user_name)
  station = Station.find_by_name(station_name)
  Factory(:subscription,:user=>@notifiee,:station=>station)
end

Given /^I am logged in as a firefighter named "([^\"]*)" who is a publisher for "([^\"]*)"$/ do |name, station_name|
  @user = Factory :email_confirmed_user,:email => "ethan.vizitei@gmail.com",:name=> name,
                                        :password => "fire_district",:password_confirmation => "fire_district"
  station = Station.find_by_name(station_name)                                      
  Factory(:subscription,:user=>@user,:station=>station)                            
  Given %{I sign in as "#{@user.email}/fire_district"}
end

When /^the system process all background jobs$/ do
  Delayed::Job.work_off
end

Then /^the firefighter named "([^\"]*)" should have received a notification saying "([^\"]*)"$/ do |user_name, message|
  notified_user = User.find_by_name(user_name)
  notice = notified_user.received_notifications.last.notification
  assert_equal message,notice.message
end

