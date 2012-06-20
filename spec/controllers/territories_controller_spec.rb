require 'spec_helper'

describe TerritoriesController do

  def valid_attributes
    Factory.build(:territory).attributes
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all territories as @territories" do
      territory = Territory.create! valid_attributes
      get :index, {}, valid_session
      assigns(:territories).should eq([territory])
    end
  end

  describe "GET show" do
    it "assigns the requested territory as @territory" do
      territory = Territory.create! valid_attributes
      get :show, {:id => territory.to_param}, valid_session
      assigns(:territory).should eq(territory)
    end
  end

  describe "GET new" do
    it "assigns a new territory as @territory" do
      get :new, {}, valid_session
      assigns(:territory).should be_a_new(Territory)
    end
  end

  describe "GET edit" do
    it "assigns the requested territory as @territory" do
      territory = Territory.create! valid_attributes
      get :edit, {:id => territory.to_param}, valid_session
      assigns(:territory).should eq(territory)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Territory" do
        expect {
          post :create, {:territory => valid_attributes}, valid_session
        }.to change(Territory, :count).by(1)
      end

      it "assigns a newly created territory as @territory" do
        post :create, {:territory => valid_attributes}, valid_session
        assigns(:territory).should be_a(Territory)
        assigns(:territory).should be_persisted
      end

      it "redirects to the created territory" do
        post :create, {:territory => valid_attributes}, valid_session
        response.should redirect_to(Territory.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved territory as @territory" do
        # Trigger the behavior that occurs when invalid params are submitted
        Territory.any_instance.stub(:save).and_return(false)
        post :create, {:territory => {}}, valid_session
        assigns(:territory).should be_a_new(Territory)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Territory.any_instance.stub(:save).and_return(false)
        post :create, {:territory => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested territory" do
        territory = Territory.create! valid_attributes
        # Assuming there are no other territories in the database, this
        # specifies that the Territory created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Territory.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => territory.to_param, :territory => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested territory as @territory" do
        territory = Territory.create! valid_attributes
        put :update, {:id => territory.to_param, :territory => valid_attributes}, valid_session
        assigns(:territory).should eq(territory)
      end

      it "redirects to the territory" do
        territory = Territory.create! valid_attributes
        put :update, {:id => territory.to_param, :territory => valid_attributes}, valid_session
        response.should redirect_to(territory)
      end
    end

    describe "with invalid params" do
      it "assigns the territory as @territory" do
        territory = Territory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Territory.any_instance.stub(:save).and_return(false)
        put :update, {:id => territory.to_param, :territory => {}}, valid_session
        assigns(:territory).should eq(territory)
      end

      it "re-renders the 'edit' template" do
        territory = Territory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Territory.any_instance.stub(:save).and_return(false)
        put :update, {:id => territory.to_param, :territory => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested territory" do
      territory = Territory.create! valid_attributes
      expect {
        delete :destroy, {:id => territory.to_param}, valid_session
      }.to change(Territory, :count).by(-1)
    end

    it "redirects to the territories list" do
      territory = Territory.create! valid_attributes
      delete :destroy, {:id => territory.to_param}, valid_session
      response.should redirect_to(territories_url)
    end
  end

end
