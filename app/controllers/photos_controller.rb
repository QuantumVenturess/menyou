class PhotosController < ApplicationController
  before_filter :authenticate, except: :gallery

  def gallery
    @title = 'Gallery'
    @photos = Photo.order('created_at DESC').paginate(page: 
      params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @title = 'Photos'
    @photos = Photo.order('created_at DESC')
  end

  def new
    @title = 'New Photo'
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      @photo.resize_image
      @photo.save_dimensions
      flash[:success] = 'Photo created'
      redirect_to photos_path
    else
      @title = 'New Photo'
      render 'new'
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    flash[:notice] = 'Photo deleted'
    redirect_to photos_path
  end

  def upload
    @title = 'Upload photo'
  end

  def upload_photo
    upload_name = params[:upload][:name]
    if params[:upload][:file].nil?
      flash[:error] = 'File cannot be blank'
      redirect_to upload_path
    else
      name = params[:upload][:file].original_filename
      directory = 'public/photos'
      path = File.join(directory, name)
      File.open(path, 'wb') { |f| f.write(params[:upload][:file].read) }
      file = File.open(path)
      dim = FastImage.size(file)
      ext = File.extname(file).split('.')[-1]
      file.close
      if dim[0] > 1024 || dim[1] > 720
        image = MiniMagick::Image.open(path)
        image.resize '1024x720'
        image.format ext
        image.write path
      end
      resized_file = File.open(path)
      dim = FastImage.size(resized_file)
      photo = Photo.new
      photo.name = !upload_name.blank? ? upload_name \
        : name.split(".#{ext}")[0]
      photo.file = resized_file
      photo.width = dim[0]
      photo.height = dim[1]
      photo.save!
      resized_file.close
      File.delete(path)
      redirect_to photos_path
    end
  end
end