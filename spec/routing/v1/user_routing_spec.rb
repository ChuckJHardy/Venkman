require 'spec_helper'

describe "User Routes" do
  describe "GET '/users'" do
    it {
      should route(:get, "/v1/users").
      to(:controller => 'v1/users', :action => :index)
    }
  end
end
