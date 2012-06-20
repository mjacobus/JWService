require "spec_helper"

describe ApartmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/apartments").should route_to("apartments#index")
    end

    it "routes to #new" do
      get("/apartments/new").should route_to("apartments#new")
    end

    it "routes to #show" do
      get("/apartments/1").should route_to("apartments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/apartments/1/edit").should route_to("apartments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/apartments").should route_to("apartments#create")
    end

    it "routes to #update" do
      put("/apartments/1").should route_to("apartments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/apartments/1").should route_to("apartments#destroy", :id => "1")
    end

  end
end
