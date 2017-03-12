require 'rails_helper'

RSpec.describe "Follows", type: :request do
  before do
    @user = create :user
    @followee = create :user
    sign_in @user
  end

  describe "POST #create" do
    it "returns http success and creates the Follow" do
      expect {
        post follows_path, { followee_id: @followee.id }
      }.to change(Follow, :count).by(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success and deletes the Follow" do
      create :follow, follower: @user, followee: @followee

      expect {
        delete follows_path, { followee_id: @followee.id }
      }.to change(Follow, :count).by(-1)
      expect(response).to have_http_status(:success)
    end
  end
end
