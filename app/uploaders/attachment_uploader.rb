require 'carrierwave/processing/rmagick'
class AttachmentUploader < CarrierWave::Uploader::Base
  #include CarrierWave::RMagick
  include Magick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(doc pdf)
  end

  version :attachment, if: :pdf? do
    process :pdf_to_images
  end

  def pdf?(new_file)
    new_file.content_type.include? 'pdf'
  end

  def pdf_to_images(new_file)
    i = 0
    manipulate! do |image|
      pdf = ImageList.new image.filename
      png = pdf[i]
      png.write("#{Rails.root}/public/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/p#{i+1}.png")
      @slide = Slide.create()
      @slide.presentation_id = "#{model.id}"
      @slide.image = "p#{i+1}.png"
      @slide.save
      i = i + 1
      png
    end
  end
end