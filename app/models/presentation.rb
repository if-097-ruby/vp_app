class Presentation < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :attachment, AttachmentUploader
  validates :name, length: { in: 3..40 }
  validates :attachment, presence: true
end
