require 'rails_helper'

RSpec.describe "faves routes", type: :routing do
  it "routes /faves to faves#create" do
    expect(post: "/faves").to route_to(
      controller: "faves",
      action: "create",
    )
  end

  it "routes /faves to faves#destroy" do
    expect(delete: "/faves").to route_to(
      controller: "faves",
      action: "destroy"
    )
  end
end
