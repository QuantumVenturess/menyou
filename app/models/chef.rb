class Chef < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :image,
                    default_url: '/assets/default.jpg',
                    storage: :s3,
                    s3_credentials: "#{Rails.root}/config/s3.yml",
                    path: "/chefs/:style/:id/:filename"

  attr_accessible :image, :info, :name

  validates :info, presence: true
  validates :name, presence: true
  validates_uniqueness_of :name

  def deletable?
    true if Chef.find_by_id(self.id)
  end
end