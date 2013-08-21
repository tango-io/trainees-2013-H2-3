class Project < ActiveRecord::Base

  #Database Relations
  belongs_to :user
  belongs_to :category
  has_many :backs

  #Validations
  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :close_date
  validates_presence_of :description
  validates_presence_of :video_url
  validates_presence_of :amount
  validates_presence_of :user_id
  validates_presence_of :category_id

  validates_numericality_of :amount
  validates_uniqueness_of :name 

  validates_format_of :video_url, :with => %r{\.(mp4|ogg|ogv)}
  mount_uploader :video_url, ProjectVideoUploader

  def approve!
    self.approved = true
    self.save
  end
end
