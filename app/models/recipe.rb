class Recipe < ActiveRecord::Base
  searchkick
  belongs_to :user
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :comments, dependent: :destroy

  #extend FriendlyId
  #friendly_id :name, use: :slugged
  has_attached_file :image, styles: { medium: "600x400#", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name
  validates_presence_of :origin
  validates_presence_of :ingredients
  validates_presence_of :description
  validates_presence_of :image
  
  acts_as_votable
  paginates_per 8

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
