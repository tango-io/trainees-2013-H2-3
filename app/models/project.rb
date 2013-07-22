class Project < ActiveRecord::Base
  belongs_to :user
  mount_uploader :video_url, ProjectVideoUploader
end
