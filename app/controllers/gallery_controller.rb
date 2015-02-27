class GalleryController < ApplicationController
  def index
    @collection = Gallery.published
  end

  def show
    @gallery = Gallery.find(params[:id])
  end
end
