require 'rails_helper'

RSpec.describe "Faves", type: :request do
  before do
    @user = create :user
    @zwipp = create :zwipp
    sign_in @user
  end

  describe "GET #create" do
    it "returns http success" do
      expect {
        post faves_path, { zwipp_id: @zwipp.id }
      }.to change(Fave, :count).by(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      create :fave, user: @user, zwipp: @zwipp

      expect {
        delete faves_path, { zwipp_id: @zwipp.id }
      }.to change(Fave, :count).by(-1)
      expect(response).to have_http_status(:success)
    end
  end
end
