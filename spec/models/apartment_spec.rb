require 'spec_helper'

describe Apartment do
  before(:each) do
    @apartment = Factory(:apartment)
    @building = @apartment.building
  end
  
  context "Validation" do
    # mandatory fields
    %w(number).each do |field|
      it "must have a #{field}" do
        @apartment.send("#{field}=", nil)
        @apartment.should_not be_valid
        @apartment.should have(1).errors_on(field)
      end
    end
    
    # unique fields
    it "must have unique number" do
      @new_apartment = Factory.build(:apartment, 
        :building => @building, 
        :number => @apartment.number.to_s.upcase
      )
      @new_apartment.should_not be_valid
      @new_apartment.should have(1).errors_on(:number)
    end
    
  end
  
end
