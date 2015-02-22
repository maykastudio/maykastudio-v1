class Gallery < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :title, :use => [:slugged, :finders]

  has_many :images, :dependent => :destroy

  validates_presence_of :title

  alias_attribute :to_s, :title
end
