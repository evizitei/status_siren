# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
bcfpd = Department.find_or_create_by_name(:name=>"Boone County Fire Protection District")
station = Station.find_or_create_by_name(:name=>"Station 14")
station.update_attributes!(:department_id=>bcfpd.id)
ethan = User.find_or_create_by_email("ethan.vizitei@gmail.com")
ethan.update_attributes!(:name=>"Ethan Vizitei",:department_id=>bcfpd.id,:password=>"fire_district",:email=>"ethan.vizitei@gmail.com",:email_confirmed=>true,:mobile_phone=>"5732395840")
ethan.update_password("fire_district","fire_district")
Subscription.create!(:station=>station,:user=>ethan)