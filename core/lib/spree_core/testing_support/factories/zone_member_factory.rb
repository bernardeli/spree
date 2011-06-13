Factory.define(:zone_member) do |f|
  f.zone Factory(:zone)
  f.zoneable Factory(:country)
end
