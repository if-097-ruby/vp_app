class AttachmentUploader < CarrierWave::Uploader::Base

  after :store, :convert_to_images
  after :store, :set_content_type_png
  
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end 

  def extension_whitelist
    %w(doc pdf)
  end

  include CarrierWave::MiniMagick

  # version :png do
  #   process :convert_to_images
  #   process :set_content_type_png

    def convert_to_images(*args)
      image = MiniMagick::Image.open(current_path)
      image.pages.each_with_index do |page, index|
        MiniMagick::Tool::Convert.new do |convert|
          convert.background 'white'
          convert.flatten
          convert.density 300
          convert.quality 95
          convert << page.path
          convert << "#{CarrierWave.root}/#{store_dir}/image-#{index}.png"
          Slide.create(image: convert, presentation_id: model.id)
        end
      #Slide.create(image: image, presentation_id: model.id)
      end
    end     

  def set_content_type_png(*args)
    self.file.instance_variable_set(:@content_type, "image/png")
  end

end