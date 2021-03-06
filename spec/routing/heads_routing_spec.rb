require "rails_helper"

RSpec.describe HeadsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/heads").to route_to("heads#index")
    end




    it "routes to #new" do
      expect(:get => "/api/v1/heads/new").not_to be_routable
    end

    it "routes to #create" do
      expect(:post => "/api/v1/heads").not_to be_routable
    end


    it "routes to #show1" do
      expect(:get => "/api/v1/heads/1").not_to be_routable
    end

    it "routes to #edit1" do
      expect(:get => "/api/v1/heads/1/edit").not_to be_routable
    end

    it "routes to #update via PUT1" do
      expect(:put => "/api/v1/heads/1").not_to be_routable
    end

    it "routes to #update via PATCH1" do
      expect(:patch => "/api/v1/heads/1").not_to be_routable
    end

    it "routes to #destroy1" do
      expect(:delete => "/api/v1/heads/1").not_to be_routable
    end

    it "routes to #edit" do
      expect(:get => "/api/v1/heads/edit").not_to be_routable
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/heads").not_to be_routable
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/heads").not_to be_routable
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/heads").not_to be_routable
    end


  end
end
