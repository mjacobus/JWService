require 'spec_helper'

describe Territory do
  before(:each) do
    @territory = Factory(:territory)
  end

  context "Validation" do
    it "must have a name" do
      @territory.name = nil
      @territory.should_not be_valid
      @territory.should have(1).errors_on(:name)
    end
    
    it "must have a unique name" do
      @new_territory = Factory.build(:territory, :name => @territory.name.upcase)
      @new_territory.should_not be_valid
      @new_territory.should have(1).errors_on(:name)
    end
  end
end
