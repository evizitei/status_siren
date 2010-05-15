Given /^there is a department called "([^\"]*)"$/ do |name|
  @department = Factory(:department,:name=>name)
end

Given /^there is a station named "([^\"]*)" in that department$/ do |name|
  @station = Factory(:station,:name=>name,:department=>@department)
end

Given /^there is a station named "([^\"]*)" in "([^\"]*)"$/ do |station_name, dept_name|
  dept = Department.find_or_create_by_name(dept_name)
  station = Station.find_or_create_by_name(station_name)
  station.department = dept
  station.save!
end