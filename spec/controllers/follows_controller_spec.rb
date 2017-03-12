require 'rails_helper'

RSpec.describe FollowsController, type: :controller do
  before do
    @user = create :user
    @followee = create :user
    sign_in @user
  end

  describe "POST #create" do
    it "returns http success and creates the Follow" do
      expect {
        post :create, { followee_id: @followee.id }
      }.to change(Follow, :count).by(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success and deletes the Follow" do
      follow = create :follow, follower: @user, followee: @followee
      expect {
        delete :destroy, { followee_id: @followee.id }
      }.to change(Follow, :count).by(-1)
      expect(response).to have_http_status(:success)
    end
  end
end
