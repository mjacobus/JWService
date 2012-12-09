require 'spec_helper'

describe Apartment do
  context "Validation" do
    let(:apartment) { Factory(:apartment) }
    let(:building) { apartment.building }
    
    # mandatory fields
    %w(number).each do |field|
      it "should have a #{field}" do
        apartment.send("#{field}=", nil)
        apartment.should_not be_valid
        apartment.should have(1).errors_on(field)
      end
    end
    
    # unique fields
    it "must have unique number" do
      @new_apartment = Factory.build(:apartment, 
        :building => building, 
        :number => apartment.number.to_s.upcase
      )
      @new_apartment.should_not be_valid
      @new_apartment.should have(1).errors_on(:number)
    end
  end
  
  
  describe "scopes" do
    subject { Apartment }
    
    describe '.visited/.unvisited' do
      let(:visited)   { [Factory(:apartment, visited: true)] }
      let(:unvisited) { [Factory(:apartment, visited: false)] }
      
      its(:visited) { should =~ visited }
      its(:unvisited) { should =~ unvisited }
    end
    
    describe ".to_revisit/.not_to_revisit" do
      let(:to_revisit) { [Factory(:apartment, revisit: true)] }
      let(:not_to_revisit) { [Factory(:apartment, revisit: false)] }
     
      its(:to_revisit) { should =~ to_revisit }
      its(:not_to_revisit) { should =~ not_to_revisit }
    end
  end
end

