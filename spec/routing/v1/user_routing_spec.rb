require 'spec_helper'

describe "User Routes" do
  describe "GET 'v1/users'" do
    it {
      { get: 'v1/users/1'}.
        should route_to(
          controller: 'v1/users',
          action: 'show',
          id: '1'
      )
    }

    it {
      { post: 'v1/users'}.
        should route_to(
          controller: 'v1/users',
          action: 'create'
      )
    }

    it {
      { put: 'v1/users/1'}.
        should route_to(
          controller: 'v1/users',
          action: 'update',
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
end
