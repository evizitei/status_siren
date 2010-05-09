Factory.define :subscription do |s|
  s.user {|e| e.association(:user)}
  s.station {|e| e.association(:station)}
end