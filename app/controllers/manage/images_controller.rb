class Manage::ImagesController < Manage::ApplicationController
  inherit_resources

  belongs_to :gallery
  actions :all, :except => [:index, :show, :create]
  custom_actions :collection => :sort

  def create
    @gallery = Gallery.find(params[:gallery_id])

    @image = @gallery.images.create(:file => params[:file])

    if @image.save!
      respond_to do |format|
        format.json { render :json => @image }
      end
    end
  end

  def sort
    sort! {
      @gallery.sort_images(params[:image])

      render :nothing => true and return
    }
  end

  private

  def permitted_params
    params.permit(:image => [:title, :alt, :description, :file])
  end
end
