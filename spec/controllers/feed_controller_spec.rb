require 'rails_helper'

RSpec.describe FeedController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status :redirect
      expect(response).to redirect_to user_session_path
    end

    context 'when signed in' do
      before { sign_in create :user }

      it "returns http success" do
        get :index
        expect(response).to have_http_status :success
        expect(response).to render_template :index
      end
    end
  end
end
