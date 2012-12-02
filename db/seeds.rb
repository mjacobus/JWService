# territories
1.upto(10) do |t|
  territory = Territory.find_or_create_by_name("T#{t}")

  # buildings  
  1.upto(10) do |b|
    building = Building.find_or_create_by_number_and_territory_id({
      number: b,
      territory_id: territory.id,
      address: "Street number #{b}"
    })
    
    # floors
    1.upto(10) do |f|
      # apartments
      1.upto(4) do |a|
        Apartment.find_or_create_by_number_and_building_id({
          building_id: building.id,
          number: "#{f}#{a}".to_i
        })
      end
    end
  end
end
