require "rails_helper"

RSpec.describe ActionTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/action_types").to route_to("action_types#index")
    end

    it "routes to #new" do
      expect(:get => "/action_types/new").to route_to("action_types#new")
    end

    it "routes to #show" do
      expect(:get => "/action_types/1").to route_to("action_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/action_types/1/edit").to route_to("action_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/action_types").to route_to("action_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/action_types/1").to route_to("action_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/action_types/1").to route_to("action_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/action_types/1").to route_to("action_types#destroy", :id => "1")
    end

  end
end
