require 'spec_helper'

describe "apartments/new" do
  before(:each) do
    assign(:apartment, stub_model(Apartment,
      :address => "MyString",
      :number => "MyString",
      :description => "MyText",
      :territory => nil
    ).as_new_record)
  end

  it "renders new apartment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => apartments_path, :method => "post" do
      assert_select "input#apartment_address", :name => "apartment[address]"
      assert_select "input#apartment_number", :name => "apartment[number]"
      assert_select "textarea#apartment_description", :name => "apartment[description]"
      assert_select "input#apartment_territory", :name => "apartment[territory]"
    end
  end
end
