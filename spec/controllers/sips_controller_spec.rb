require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any sip libraries to generate different
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

RSpec.describe SipsController, :type => :controller do

  let(:valid_session) { {} }
  let(:json_response) { { format: 'json' } }

  describe "GET index" do
    it "assigns all sips as @sips" do
      sip = create(:sip)
      get :index, json_response
      expect(assigns(:sips)).to eq([sip])
    end
  end

  describe "GET show" do
    it "assigns the requested sip as @sip" do
      sip = create(:sip)
      get :show, json_response.merge({ id: sip.id })
      expect(assigns(:sip)).to eq(sip)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sip" do
        expect {
          post :create, json_response.merge({sip: attributes_for(:sip)})
        }.to change(Sip, :count).by(1)
      end

      it "assigns a newly created sip as @sip" do
        post :create, json_response.merge({sip: attributes_for(:sip)})
        expect(assigns(:sip)).to be_a(Sip)
        expect(assigns(:sip)).to be_persisted
      end

      it "redirects to the created sip" do
        post :create, json_response.merge({sip: attributes_for(:sip)})
        expect(response).to redirect_to(Sip.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sip as @sip" do
        post :create, json_response.merge({sip: attributes_for(:sip)})
        expect(assigns(:sip)).to be_a_new(Sip)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        attributes_for(:sip).merge(name: 'new_name')
      }

      it "updates the requested sip" do
        sip = create(:sip)
        put :update, json_response.merge({id: sip.id, sip: new_attributes})
        expect change { sip.reload.title }.to('new_name')
      end

      it "assigns the requested sip as @sip" do
        sip = create(:sip)
        put :update, json_response.merge({id: sip.id, sip: attributes_for(:sip)})
        expect(assigns(:sip)).to eq(sip)
      end
    end

    describe "with invalid params" do
      it "assigns the sip as @sip" do
        sip = create(:sip)
        put :update, json_response.merge({id: sip.id, sip: attributes_for(:sip)})
        expect(assigns(:sip)).to eq(sip)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sip" do
      sip = create(:sip)
      expect {
        delete :destroy, json_response.merge({id: sip.id})
      }.to change(Sip, :count).by(-1)
    end
  end

end
