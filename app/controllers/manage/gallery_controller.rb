class Manage::GalleryController < Manage::ApplicationController
  inherit_resources
  actions :all

  def create
    create!(:notice => 'Альбом добавлен успешно!')
  end

  def update
    update!(:notice => 'Альбом сохранен.')
  end

  def destroy
    destroy!(:notice => 'Альбом успешно удален!') { manage_gallery_index_path }
  end

  private

  def collection
    @collection = Gallery.order(:created_at)
  end

  def permitted_params
    params.permit(:gallery => [:title, :description, :image, :state])
  end
end
