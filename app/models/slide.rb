class Slide < ApplicationRecord

  belongs_to :presentation
  mount_uploader :image, AttachmentUploader

end