SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'

  navigation.items do |primary|
    primary.item :gallery, I18n.t('page_title.gallery.index'), manage_root_path do |gallery|
      if @gallery && @gallery.persisted?
        gallery.item :show,  I18n.t('page_title.gallery.show', :title => @gallery),  manage_gallery_path(@gallery) do |image|
          image.item :edit,  I18n.t('page_title.image.edit', :title => @image),  edit_manage_gallery_image_path(@gallery, @image) if @image
        end
        gallery.item :edit,  I18n.t('page_title.gallery.edit', :title => @gallery),  edit_manage_gallery_path(@gallery)
      end
      gallery.item :new,   I18n.t('page_title.gallery.new'),   new_manage_gallery_path
    end
  end
end
