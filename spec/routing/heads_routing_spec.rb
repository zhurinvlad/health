require "rails_helper"

RSpec.describe HeadsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/heads").to route_to("heads#index")
    end

    it "routes to #new" do
      expect(:get => "/heads/new").to route_to("heads#new")
    end

    it "routes to #show" do
      expect(:get => "/heads/1").to route_to("heads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/heads/1/edit").to route_to("heads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/heads").to route_to("heads#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/heads/1").to route_to("heads#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/heads/1").to route_to("heads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/heads/1").to route_to("heads#destroy", :id => "1")
    end

  end
end
