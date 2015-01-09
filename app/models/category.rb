class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	has_attached_file :image,
					  default_url: '/assets/default_category.jpg',
					  storage: :s3,
					  s3_credentials: "#{Rails.root}/config/s3.yml",
					  path: "/:style/:id/:filename"

 	attr_accessible :name, :image

 	has_many :items

 	validates :name, presence: true
 	validates_uniqueness_of :name

 	def deletable?
 		if Category.find_by_id(self.id) && self.items.empty?
 			true
 		else
 			false
 		end
 	end
end