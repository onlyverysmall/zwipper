require 'rails_helper'

RSpec.describe "Zwipps", type: :request do
  before :each do
    @user = create :user
    sign_in @user
  end

  describe "GET #new" do
    it "returns http success" do
      get new_zwipp_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      expect {
        post zwipps_path, { zwipp: { text: "some great text!" } }
      }.to change(Zwipp, :count).by(1)
      expect(response).to redirect_to zwipp_path(Zwipp.last.id)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      zwipp = create :zwipp
      get zwipp_path(zwipp.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      zwipp = create :zwipp
      expect {
        delete zwipp_path(zwipp.id)
      }.to change(Zwipp, :count).by(-1)
      expect(response).to redirect_to user_path(@user.id)
    end
  end
end
