require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe BodiesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Body. As you add validations to Body, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BodiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all bodies as @bodies" do
      body = Body.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:bodies)).to eq([body])
    end
  end

  describe "GET #show" do
    it "assigns the requested body as @body" do
      body = Body.create! valid_attributes
      get :show, {:id => body.to_param}, valid_session
      expect(assigns(:body)).to eq(body)
    end
  end

  describe "GET #new" do
    it "assigns a new body as @body" do
      get :new, {}, valid_session
      expect(assigns(:body)).to be_a_new(Body)
    end
  end

  describe "GET #edit" do
    it "assigns the requested body as @body" do
      body = Body.create! valid_attributes
      get :edit, {:id => body.to_param}, valid_session
      expect(assigns(:body)).to eq(body)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Body" do
        expect {
          post :create, {:body => valid_attributes}, valid_session
        }.to change(Body, :count).by(1)
      end

      it "assigns a newly created body as @body" do
        post :create, {:body => valid_attributes}, valid_session
        expect(assigns(:body)).to be_a(Body)
        expect(assigns(:body)).to be_persisted
      end

      it "redirects to the created body" do
        post :create, {:body => valid_attributes}, valid_session
        expect(response).to redirect_to(Body.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved body as @body" do
        post :create, {:body => invalid_attributes}, valid_session
        expect(assigns(:body)).to be_a_new(Body)
      end

      it "re-renders the 'new' template" do
        post :create, {:body => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested body" do
        body = Body.create! valid_attributes
        put :update, {:id => body.to_param, :body => new_attributes}, valid_session
        body.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested body as @body" do
        body = Body.create! valid_attributes
        put :update, {:id => body.to_param, :body => valid_attributes}, valid_session
        expect(assigns(:body)).to eq(body)
      end

      it "redirects to the body" do
        body = Body.create! valid_attributes
        put :update, {:id => body.to_param, :body => valid_attributes}, valid_session
        expect(response).to redirect_to(body)
      end
    end

    context "with invalid params" do
      it "assigns the body as @body" do
        body = Body.create! valid_attributes
        put :update, {:id => body.to_param, :body => invalid_attributes}, valid_session
        expect(assigns(:body)).to eq(body)
      end

      it "re-renders the 'edit' template" do
        body = Body.create! valid_attributes
        put :update, {:id => body.to_param, :body => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested body" do
      body = Body.create! valid_attributes
      expect {
        delete :destroy, {:id => body.to_param}, valid_session
      }.to change(Body, :count).by(-1)
    end

    it "redirects to the bodies list" do
      body = Body.create! valid_attributes
      delete :destroy, {:id => body.to_param}, valid_session
      expect(response).to redirect_to(bodies_url)
    end
  end

end
