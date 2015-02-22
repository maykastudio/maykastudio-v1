class GalleryController < ApplicationController
  def index
    @collection = Gallery.limit(5)
  end

  def show
    @gallery = Gallery.find(params[:id])
  end
end
