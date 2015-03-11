class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  version :main do
    process :resize_to_fit => [870,580]
  end

  version :large do
    process :resize_to_fit => [1140, 760]
  end

  version :medium do
    process :resize_to_fit => [570, 380]
  end

  version :thumb do
    process :resize_to_fit => [270, 180]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
