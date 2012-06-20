require 'spec_helper'

describe Building do
  before(:each) do
    @building = Factory(:building)
  end

  context "Validation" do
  
    # mandatory fields
    %w(address number territory).each do |field|
      it "must have #{field}" do
        @building.send("#{field}=", nil)
        @building.should_not be_valid
        @building.should have(1).errors_on(field)
      end
    end 
    
    # unique fields
    it "must have only one street+number" do
      @new_building = Factory.build(:building,
        :address => @building.address.upcase,
        :number => @building.number
      )
      @new_building.should_not be_valid
      @new_building.should have(1).errors_on(:address)
    end
  end

end
