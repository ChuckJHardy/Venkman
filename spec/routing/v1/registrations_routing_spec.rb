require 'spec_helper'

describe "Registrations Routes" do
  it {
    { post: 'v1/registrations'}.
    should route_to(
      controller: 'v1/registrations',
      action: 'create'
    )
  }
end
