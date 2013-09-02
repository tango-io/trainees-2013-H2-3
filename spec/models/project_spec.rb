require 'spec_helper'

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

  #describe 'uniqueness' do
    #it { should validate_uniqueness_of :name }
  #end
  describe 'scopes' do
    FactoryGirl.create(:project)
    it 'projects approved' do
    Project.published.last.should == Project.last
    end
  end
end
