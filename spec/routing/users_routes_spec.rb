require 'rails_helper'

RSpec.describe "users routes", type: :routing do
  it "routes users/:id to users#show" do
    expect(get: "/users/1").to route_to(
      controller: "users",
      action: "show",
      id: "1"
    )
  end
end
