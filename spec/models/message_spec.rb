require 'spec_helper'

describe Message do
  describe 'Relationships' do
    it { should belong_to(:user) }
  end

  describe 'Mass Assignment' do
    it { should allow_mass_assignment_of(:subject) }
    it { should allow_mass_assignment_of(:body) }
  end
end
