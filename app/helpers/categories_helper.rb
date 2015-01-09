module CategoriesHelper

	def category_list
		Category.order('name ASC').collect { |c| [c.name, c.id] }
	end
end