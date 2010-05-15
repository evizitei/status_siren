Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.sequence :phone do |n|
  (5552221111 + n).to_s
end

Factory.define :user do |user|
  user.email                 { Factory.next :email }
  user.password              { "password" }
  user.password_confirmation { "password" }
  user.department            {|e| e.association :department}
  user.name "Firstname Lastname"
  user.mobile_phone {Factory.next :phone}
  user.mobile_carrier "at&t"
end

Factory.define :email_confirmed_user, :parent => :user do |user|
  user.email_confirmed { true }
end

Factory.define :normal_user,:parent=>:email_confirmed_user do |user|
end
