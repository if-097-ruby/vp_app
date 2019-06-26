class AttachmentUploader < CarrierWave::Uploader::Base

  after :store, :convert_to_images
  
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end 

  def extension_whitelist
    %w(pdf png)
  end

  include CarrierWave::MiniMagick

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
      end
    Slide.create(image: File.open("#{CarrierWave.root}/#{store_dir}/image-#{index}.png"), presentation_id: model.id)
    end
  end   
end