class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :backs
  mount_uploader :video_url, ProjectVideoUploader
end
