require 'spec_helper'

describe "User Routes" do
  it {
    { get: 'v1/users/1'}.
    should route_to(
      controller: 'v1/users',
      action: 'show',
      id: '1'
    )
  }

  it {
    { delete: 'v1/users/1' }.
    should route_to(
      controller: 'v1/users',
      action: 'destroy',
      id: '1'
    )
  }
end
