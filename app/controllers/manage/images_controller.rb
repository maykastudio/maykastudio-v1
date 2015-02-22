class Manage::ImagesController < ApplicationController
  inherit_resources

  belongs_to :gallery
  actions :all, :except => [:index, :show, :create]

  def create
    @gallery = Gallery.find(params[:gallery_id])

    @image = @gallery.images.create(:file => params[:file])

    if @image.save!
      respond_to do |format|
        format.json { render :json => @image }
      end
    end

  end

  private

  def permitted_params
    params.permit(:image => [:title, :alt, :description, :file])
  end
end
