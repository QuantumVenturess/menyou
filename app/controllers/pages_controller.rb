class PagesController < ApplicationController
	before_filter :authenticate, only: [:test, :test_upload]

	def home
		@title = 'Golden Dragon'
	end

	def menu
		@title = 'Menu'
		@categories = Category.order('name ASC')
	end

	def about
		@title = 'About'
	end

	def test
		@title = 'Test'
	end

  def test_upload
    name = params[:upload][:file].original_filename
    directory = 'public/photos/upload'
    path = File.join(directory, name)
    File.open(path, 'wb') { |f| f.write(params[:upload][:file].read) }
    dim = FastImage.size(path)
    flash[:success] = "#{dim}"
    redirect_to test_path
  end
end