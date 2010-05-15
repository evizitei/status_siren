When /^the system process all background jobs$/ do
  Delayed::Job.work_off
end

Then /^the firefighter named "([^\"]*)" should have received a notification saying "([^\"]*)"$/ do |user_name, message|
  notified_user = User.find_by_name(user_name)
  notice = notified_user.received_notifications.last.notification
  assert_equal message,notice.message
end

