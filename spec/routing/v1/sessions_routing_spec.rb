require 'spec_helper'

describe "Sessions Routes" do
  it {
    { post: 'v1/sessions'}.
    should route_to(
      controller: 'v1/sessions',
      action: 'create'
    )
  }

  it {
    { delete: 'v1/sessions' }.
    should route_to(
      controller: 'v1/sessions',
      action: 'destroy'
    )
  }
end
