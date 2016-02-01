require "rails_helper"

RSpec.describe BodiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bodies").to route_to("bodies#index")
    end

    it "routes to #new" do
      expect(:get => "/bodies/new").to route_to("bodies#new")
    end

    it "routes to #show" do
      expect(:get => "/bodies/1").to route_to("bodies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bodies/1/edit").to route_to("bodies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/bodies").to route_to("bodies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bodies/1").to route_to("bodies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bodies/1").to route_to("bodies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bodies/1").to route_to("bodies#destroy", :id => "1")
    end

  end
end
