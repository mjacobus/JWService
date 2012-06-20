require 'spec_helper'

describe "apartments/edit" do
  before(:each) do
    @apartment = assign(:apartment, stub_model(Apartment,
      :address => "MyString",
      :number => "MyString",
      :description => "MyText",
      :territory => nil
    ))
  end

  it "renders the edit apartment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => apartments_path(@apartment), :method => "post" do
      assert_select "input#apartment_address", :name => "apartment[address]"
      assert_select "input#apartment_number", :name => "apartment[number]"
      assert_select "textarea#apartment_description", :name => "apartment[description]"
      assert_select "input#apartment_territory", :name => "apartment[territory]"
    end
  end
end
