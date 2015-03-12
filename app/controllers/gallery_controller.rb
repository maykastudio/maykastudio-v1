class GalleryController < ApplicationController
  inherit_resources
  actions :index, :show

  def show
    show!

    fresh_when @gallery and return
  end

  private

  def collection
    @collection = Gallery.published
  end
end
