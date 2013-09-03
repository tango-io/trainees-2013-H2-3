class Project < ActiveRecord::Base

  #Database Relations
  belongs_to :user
  belongs_to :category
  has_many :backs
  has_many :pledges
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

  scope :non_closed, -> { where('close_date > :today', today: Time.now) }
  scope :non_sussesfull, -> { where('money_raised <= amount').closed } 
  scope :sussesfull, -> { where('money_raised >= amount').closed } 
  scope :closed, -> { where('created_at > :today', today: Time.now) }

  def sum_money(amount)
    unless self.money_raised.nil?
      self.money_raised += amount
    else
      self.money_raised + amount
    end
    self.save
  end

  def self.list_project_between(init_date,end_date)
    self.select("name,money_raised").where("close_date >= :init_date AND close_date <= :end_date",
                                           init_date: init_date, end_date: end_date).order('id ASC')
  end

  def approve!
    self.approved = true
    self.save
  end
end
