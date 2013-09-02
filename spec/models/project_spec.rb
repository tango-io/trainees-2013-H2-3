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

describe Project, 'Validating' do

  describe 'presence of' do

    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:close_date)}
    it { should validate_presence_of(:description)}
    #it { should validate_presence_of(:video_url)}
    it { should validate_presence_of(:amount)}
    it { should validate_presence_of(:user_id)}
    it { should validate_presence_of(:category_id)}
    it { should validate_presence_of(:amount)}

  end

  describe 'numericality' do
    it { should validate_numericality_of :amount}
  end
end
