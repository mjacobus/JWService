require "spec_helper"

describe ApartmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/buildings/10/apartments").should route_to("apartments#index",
        :building_id => "10"
      )
    end

    it "routes to #new" do
      get("/buildings/10/apartments/new").should route_to("apartments#new",
        :building_id => "10",
      )
    end

    it "routes to #show" do
      get("/buildings/10/apartments/1").should route_to("apartments#show",
        :building_id => "10",
        :id => "1"
      )
    end

    it "routes to #edit" do
      get("/buildings/10/apartments/1/edit").should route_to("apartments#edit",
        :building_id => "10",
        :id => "1"
      )
    end

    it "routes to #create" do
      post("/buildings/10/apartments").should route_to("apartments#create",
        :building_id => "10",
      )
    end

    it "routes to #update" do
      put("/buildings/10/apartments/1").should route_to("apartments#update",
        :building_id => "10",
        :id => "1"
      )
    end

    it "routes to #destroy" do
      delete("/buildings/10/apartments/1").should route_to("apartments#destroy",
        :building_id => "10",
        :id => "1"
      )
    end

  end
end
