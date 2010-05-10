Factory.define :notification do |n|
  n.message "Some Important Message"
  n.user {|e| e.association(:normal_user)}
  n.station {|e| e.association(:station)}
end