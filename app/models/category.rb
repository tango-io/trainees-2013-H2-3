class Category < ActiveRecord::Base

  #Database Relations
  has_many :projects

  #Validations
  validates_presence_of   :name
  validates_uniqueness_of :name

end
