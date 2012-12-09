require "spec_helper"

describe ScheduleController do
  describe "routing" do
    it "routes to #index" do
      get("/schedule").should route_to("schedule#index")
    end
  end
end
