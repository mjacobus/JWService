require 'spec_helper'

describe Apartment do
  before(:each) do
    @apartment = Factory(:apartment)
  end

  context "Validation" do
  
    # mandatory fields
    %w(address number territory).each do |field|
      it "must have #{field}" do
        @apartment.send("#{field}=", nil)
        @apartment.should_not be_valid
        @apartment.should have(1).errors_on(field)
      end
    end 
    
    # unique fields
    it "must have only one street+number" do
      @new_apartment = Factory.build(:apartment,
        :address => @apartment.address.upcase,
        :number => @apartment.number
      )
      @new_apartment.should_not be_valid
      @new_apartment.should have(1).errors_on(:address)
    end
  end

end
