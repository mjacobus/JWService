require 'spec_helper'

describe ApartmentsController do

  before(:each) do
    @building = Factory(:building)
    @apartment = Factory(:apartment, :building => @building)
  end

  def valid_attributes
    Factory.build(:apartment, :building => @building).attributes
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all apartments as @apartments" do
      get :index, {:building_id => @building.id}, valid_session
      assigns(:apartments).should eq([@apartment])
    end
  end

  describe "GET show" do
    it "assigns the requested apartment as @apartment" do
      get :show, {:building_id => @building.id, :id => @apartment.to_param}, valid_session
      assigns(:apartment).should eq(@apartment)
    end
  end

  describe "GET new" do
    it "assigns a new apartment as @apartment" do
      get :new, {:building_id => @building.id}, valid_session
      assigns(:apartment).should be_a_new(Apartment)
    end
  end

  describe "GET edit" do
    it "assigns the requested apartment as @apartment" do
      get :edit, {:building_id => @building.id, :id => @apartment.to_param}, valid_session
      assigns(:apartment).should eq(@apartment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Apartment" do
        expect {
          post :create, {:building_id => @building.id, :apartment => valid_attributes}, valid_session
        }.to change(Apartment, :count).by(1)
      end

      it "assigns a newly created apartment as @apartment" do
        post :create, {:building_id => @building.id, :apartment => valid_attributes}, valid_session
        assigns(:apartment).should be_a(Apartment)
        assigns(:apartment).should be_persisted
      end

      it "redirects to the created apartment" do
        post :create, {:building_id => @building.id, :apartment => valid_attributes}, valid_session
        response.should redirect_to Apartment.last.building
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved apartment as @apartment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Apartment.any_instance.stub(:save).and_return(false)
        post :create, {:building_id => @building.id, :apartment => {}}, valid_session
        assigns(:apartment).should be_a_new(Apartment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Apartment.any_instance.stub(:save).and_return(false)
        post :create, {:building_id => @building.id, :apartment => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested apartment" do
        Apartment.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:building_id => @building.id, :id => @apartment.to_param, :apartment => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested apartment as @apartment" do
        put :update, {:building_id => @building.id, :id => @apartment.to_param, :apartment => valid_attributes}, valid_session
        assigns(:apartment).should eq(@apartment)
      end

      it "redirects to the apartment" do
        put :update, {:building_id => @building.id, :id => @apartment.to_param, :apartment => valid_attributes}, valid_session
        response.should redirect_to @building
      end
    end

    describe "with invalid params" do
      it "assigns the apartment as @apartment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Apartment.any_instance.stub(:save).and_return(false)
        put :update, {:building_id => @building.id, :id => @apartment.to_param, :apartment => {}}, valid_session
        assigns(:apartment).should eq(@apartment)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Apartment.any_instance.stub(:save).and_return(false)
        put :update, {:building_id => @building.id, :id => @apartment.to_param, :apartment => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested apartment" do
      expect {
        delete :destroy, {:building_id => @building.id, :id => @apartment.to_param}, valid_session
      }.to change(Apartment, :count).by(-1)
    end

    it "redirects to the apartments list" do
      delete :destroy, {:building_id => @building.id, :id => @apartment.to_param}, valid_session
      response.should redirect_to @apartment.building
    end
  end

end
