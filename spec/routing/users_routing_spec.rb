require "rails_helper"

RSpec.describe Api::ApplicationController, type: :routing do
  describe "routing" do

    it "routes to #sign_in" do
      expect(:post => "/api/v1/auth/sign_in").to route_to("devise_token_auth/sessions#create")
    end

    it "routes to #sign_out" do
      expect(:delete => "/api/v1/auth/sign_out").to route_to("devise_token_auth/sessions#destroy")
    end

    it "routes to #password_create" do
      expect(:post => "/api/v1/auth/password").to route_to("devise_token_auth/passwords#create")
    end

    it "routes to #password_update via PUT" do
      expect(:put => "/api/v1/auth/password").to route_to("devise_token_auth/passwords#update")
    end

    it "routes to #password_update via PATCH" do
      expect(:patch => "/api/v1/auth/password").to route_to("devise_token_auth/passwords#update")
    end

    it "routes to #auth_create" do
      expect(:post => "/api/v1/auth").to route_to("devise_token_auth/registrations#create")
    end

    it "routes to #auth_update via PUT" do
      expect(:put => "/api/v1/auth").to route_to("devise_token_auth/registrations#update")
    end

    it "routes to #auth_update via PATCH" do
      expect(:patch => "/api/v1/auth").to route_to("devise_token_auth/registrations#update")
    end

    it "routes to #auth_delete" do
      expect(:delete => "/api/v1/auth").to route_to("devise_token_auth/registrations#destroy")
    end


    it "routes to #sign_in" do
      expect(:get => "/api/v1/auth/sign_in").not_to be_routable
    end

    it "routes to #password_edit" do
      expect(:get => "/api/v1/auth/password/edit").not_to be_routable
    end

    it "routes to #password_new" do
      expect(:get => "/api/v1/auth/password/new").not_to be_routable
    end


    it "routes to #cancel" do
      expect(:get => "/api/v1/auth/cancel").not_to be_routable
    end

    it "routes to #auth_sign_up" do
      expect(:get => "/api/v1/auth/sign_up").not_to be_routable
    end

    it "routes to #auth_edit" do
      expect(:get => "/api/v1/auth/edit").not_to be_routable
    end
    it "routes to #validate_token" do
      expect(:get => "/api/v1/auth/validate_token").not_to be_routable
    end

  end
end
