class CategoriesController < ApplicationController
	before_filter :authenticate, except: :show

	def show
		@category = Category.find(params[:id])
		@categories = Category.order('name ASC')
		@title = "#{@category.name}"
		@items = @category.items
	end

	def new
		@title = 'New Category'
		@category = Category.new
		@categories = Category.order('name ASC')
	end

	def create
		@category = Category.new(params[:category])
		if @category.save
			flash[:success] = 'Category created'
			redirect_to new_category_path
		else
			@title = 'New Category'
			@categories = Category.order('name ASC')
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
		@categories = Category.order('name ASC')
		@title = "Edit #{@category.name}"
		render 'new'
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			flash[:success] = 'Category updated'
			redirect_to new_category_path
		else
			@title = "Edit #{@category.name}"
			render 'new'
		end
	end

	def destroy
		category = Category.find(params[:id])
		if category.items.empty?
			category.destroy
			flash[:notice] = 'Category deleted'
			redirect_to new_category_path
		else
			flash[:error] = 'You cannot delete a category with items'
			redirect_to edit_category_path(category)
		end
	end
end