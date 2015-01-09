class Comment < ActiveRecord::Base
 	attr_accessible :email, :content
 	
 	validates :email, presence: true
	validates :content, presence: true, length: { maximum: 255, minimum: 1 }
end