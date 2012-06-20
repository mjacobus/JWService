require 'spec_helper'

describe "buildings/new" do
  before(:each) do
    assign(:building, stub_model(Building,
      :address => "MyString",
      :number => "MyString",
      :description => "MyText",
      :territory => nil
    ).as_new_record)
  end

  it "renders new building form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => buildings_path, :method => "post" do
      assert_select "input#building_address", :name => "building[address]"
      assert_select "input#building_number", :name => "building[number]"
      assert_select "textarea#building_description", :name => "building[description]"
      assert_select "select#building_territory_id", :name => "building[territory_id]"
    end
  end
end
