Factory.define :territory do |f|
  f.sequence(:name) {|n| "t#{n}"}
end

Factory.define :building do |f|
  f.sequence(:address) {|n| "street #{n}"}
  f.sequence(:number) {|n| n.to_s}
  f.association(:territory)
end

Factory.define :apartment do |f|
  f.sequence(:number) {|n| n.to_s}
  f.association(:building)
end
