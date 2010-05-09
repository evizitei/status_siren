Factory.define :station do |s|
  s.name "station name"
  s.department {|e| e.association(:department)}
end