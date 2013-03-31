require 'spec_helper'

describe "Message Routes" do
  describe "GET 'v1/users/1/messages'" do
    it {
      { get: 'v1/users/1/messages'}.
        should route_to(
          controller: 'v1/messages',
          action: 'index',
          user_id: '1'
      )
    }

    it {
      { get: 'v1/users/1/messages/1'}.
        should route_to(
          controller: 'v1/messages',
          action: 'show',
          user_id: '1',
          id: '1'
      )
    }

    it {
      { delete: 'v1/users/1/messages/1' }.
        should route_to(
          controller: 'v1/messages',
          action: 'destroy',
          user_id: '1',
          id: '1'
      )
    }
  end
end
