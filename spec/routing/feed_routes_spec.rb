require 'rails_helper'

RSpec.describe "feed routes", type: :routing do
  it "routes root to feed#index" do
    expect(get: "/").to route_to(
      controller: "feed",
      action: "index",
    )
  end
end
