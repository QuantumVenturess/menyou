class ItemsController < ApplicationController
	before_filter :authenticate

	def new
		@title = 'New Item'
		@item = Item.new
	end

	def create
		@item = Item.new(params[:item])
		if @item.save
			flash[:success] = "#{@item.name} created"
			redirect_to new_item_path
		else
			@title = 'New Item'
			render 'new'
		end
	end

	def edit
		@item = Item.find(params[:id])
		@title = "Edit #{@item.name}"
		render 'new'
	end

	def update
		@item = Item.find(params[:id])
		if @item.update_attributes(params[:item])
			flash[:success] = 'Item updated'
			redirect_to @item.category
		else
			@title = "Edit #{@item.name}"
			render 'new'
		end
	end

	def destroy
		item = Item.find(params[:id])
		item.destroy
		flash[:notice] = 'Item deleted'
		redirect_to new_item_path
	end
end