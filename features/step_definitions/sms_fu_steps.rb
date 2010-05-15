Then /^an sms_fu email should have been delivered to the firefighter named "([^\"]*)"$/ do |name|
  user = User.find_by_name(name)
  assert_not_nil user.mobile_phone
  assert !ActionMailer::Base.deliveries.empty?
  puts ActionMailer::Base.deliveries.map{|e| e.to}
  result = ActionMailer::Base.deliveries.any? do |email|
    email.to.to_s =~ /#{user.mobile_phone}/
  end
  assert result
end