class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  mount_uploader :video_url, ProjectVideoUploader
end
