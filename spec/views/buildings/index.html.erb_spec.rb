require 'spec_helper'

describe "buildings/index" do
  before(:each) do
    assign(:buildings, [
      stub_model(Building,
        :address => "Address",
        :number => "Number",
        :description => "MyText",
        :territory => nil
      ),
      stub_model(Building,
        :address => "Address",
        :number => "Number",
        :description => "MyText",
        :territory => nil
      )
    ])
  end

  it "renders a list of buildings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
