require 'spec_helper'

describe Project, 'Relations' do

  it { should belong_to(:user) }
  it { should belong_to(:category) }
  it { should have_many(:backs) }

end

describe Project, 'Scope' do
  context 'List nonclosed' do
    Project.create(:project)
    Project.closed.count == 1
  end

end

