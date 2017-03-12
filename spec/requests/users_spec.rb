require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET #show" do
    it "returns http success" do
      user = create :user
      get user_path(id: user.id)
      expect(response).to have_http_status :success
      expect(response).to render_template :show
    end
  end
end
