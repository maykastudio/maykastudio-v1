class Manage::GalleryController < Manage::ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @collection = Gallery.all
  end

  def show
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to manage_gallery_path(@gallery), :notice => 'Альбом добавлен успешно!' }
        format.json { render :show, :status => :created, :location => @gallery }
      else
        format.html { render :new }
        format.json { render :json => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to manage_gallery_path(@gallery), :notice => 'Альбом сохранен.' }
        format.json { render :show, :status => :ok, :location => @gallery }
      else
        format.html { render :edit }
        format.json { render :json => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to manage_gallery_index_path, :notice => 'Альбом успешно удален!' }
      format.json { head :no_content }
    end
  end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:title, :description, :image, :state)
    end
end
