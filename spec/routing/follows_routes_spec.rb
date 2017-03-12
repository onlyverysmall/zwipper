require 'rails_helper'

RSpec.describe "follows routes", type: :routing do
  it "routes /follows to follows#create" do
    expect(post: "/follows").to route_to(
      controller: "follows",
      action: "create",
    )
  end

  it "routes /follows to follows#destroy" do
    expect(delete: "/follows").to route_to(
      controller: "follows",
      action: "destroy"
    )
  end
end
