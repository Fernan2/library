require "rails_helper"

RSpec.describe WebController, type: :routing do
  it "routes to #about_us" do
    expect(get: "/about-us").to route_to("web#about_us")
  end

  it "keep search route as post" do
    expect(post: "/web/search").to route_to("web#search")
  end
end
