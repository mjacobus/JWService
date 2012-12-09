require 'spec_helper'

describe ScheduleController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    
    it "should assign @apartments" do
      get :index
      assigns(@apartments).should_not be_nil
    end
    
    it "should query for revisits to be made" do
      query = stub('query')
      query.should_receive(:order).with('next_revisit ASC')
      Apartment.should_receive(:to_revisit).and_return(query)
      get :index
    end
  end

end
