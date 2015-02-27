class Gallery < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :title, :use => [:slugged, :finders]

  extend Enumerize
  enumerize :state, :in => [:draft, :published], :default => :draft, :predicates => true

  has_many :images, -> { order(:position) }, :dependent => :destroy

  scope :published, -> { where(:state => :published) }
  scope :draft,     -> { where(:state => :draft) }

  validates_presence_of :title

  alias_attribute :to_s, :title

  def sort_images(items)
    items.each_with_index do |id, index|
      Image.find(id).update_attributes(:position => index + 1)
    end
  end
end
