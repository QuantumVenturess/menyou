class Item < ActiveRecord::Base

	has_attached_file :image,
          				  default_url: '/assets/default.jpg',
          				  storage: :s3,
          				  s3_credentials: "#{Rails.root}/config/s3.yml",
          				  path: "/:style/:id/:filename"

  	attr_accessible :category_id, :image, :info, :large_price, 
  					:name, :small_price, :spicy

  	belongs_to :category

  	validates :name, presence: true
  	validates_uniqueness_of :name
  	validates :category_id, presence: true

    default_scope order: 'name ASC'

    def deletable?
    	true if Item.find_by_id(self.id)
    end
end