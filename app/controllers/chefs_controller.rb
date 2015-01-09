class ChefsController < ApplicationController
  before_filter :authenticate, except: :index

  def index
    @title = 'Chefs'
    @chefs = Chef.order('name ASC')
  end

  def new
    @title = 'New Chef'
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(params[:chef])
    if @chef.save
      flash[:success] = 'Chef created'
      redirect_to chefs_path
    else
      @title = 'New Chef'
      render 'new'
    end
  end

  def edit
    @chef = Chef.find(params[:id])
    @title = "Edit #{@chef.name}"
    render 'new'
  end

  def update
    @chef = Chef.find(params[:id])
    if @chef.update_attributes(params[:chef])
      flash[:success] = 'Chef updated'
      redirect_to chefs_path
    else
      @title = "Edit #{@chef.name}"
      render 'new'
    end
  end

  def destroy
    Chef.find(params[:id]).destroy
    flash[:notice] = 'Chef deleted'
    redirect_to chefs_path
  end
end