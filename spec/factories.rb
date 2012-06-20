Factory.define :territory do |f|
  f.sequence(:name) {|n| "t#{n}"}
end
