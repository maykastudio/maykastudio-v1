class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  belongs_to :gallery, :touch => true
end
