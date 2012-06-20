require 'spec_helper'

describe "territories/edit" do
  before(:each) do
    @territory = assign(:territory, stub_model(Territory,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit territory form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => territories_path(@territory), :method => "post" do
      assert_select "input#territory_name", :name => "territory[name]"
      assert_select "textarea#territory_description", :name => "territory[description]"
    end
  end
end
