require 'spec_helper'

describe "apartments/new" do
  before(:each) do
    @apartment = Factory(:apartment)
    @building = @apartment.building
  end

  it "renders new apartment form" do
    render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form", :action => building_apartments_path(@building), :method => "post" do
      assert_select "input#apartment_number", :name => "apartment[number]"
      assert_select "input#apartment_phone", :name => "apartment[phone]"
      assert_select "input#apartment_email", :name => "apartment[email]"      
      assert_select "input#apartment_owner", :name => "apartment[owner]"
      assert_select "textarea#apartment_notes", :name => "apartment[notes]"
    end
  end
end
