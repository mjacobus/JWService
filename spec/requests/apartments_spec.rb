require 'spec_helper'

describe "Apartments" do
  describe "GET /apartments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get building_apartments_path(Factory(:building))
      response.status.should be(200)
    end
  end
end
