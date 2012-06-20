require 'spec_helper'

describe "apartments/index" do
  before(:each) do
    @building = Factory(:building)
    assign(:apartments, [
        Factory(:apartment, :building => @building),
        Factory(:apartment, :building => @building)
      ])
  end

  it "renders a list of apartments" do
    render
  end
end
