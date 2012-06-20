require 'spec_helper'

describe "apartments/show" do
  before(:each) do
    @apartment = Factory(:apartment)
    @building = @apartment.building
  end

  it "renders attributes in <p>" do
    render
  end
end
