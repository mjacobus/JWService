require 'spec_helper'

describe "buildings/edit" do
  before(:each) do
    @building = assign(:building, stub_model(Building,
      :address => "MyString",
      :number => "MyString",
      :description => "MyText",
      :territory => nil
    ))
  end

  it "renders the edit building form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => buildings_path(@building), :method => "post" do
      assert_select "input#building_address", :name => "building[address]"
      assert_select "input#building_number", :name => "building[number]"
      assert_select "textarea#building_description", :name => "building[description]"
      assert_select "select#building_territory_id", :name => "building[territory_id]"
    end
  end
end
