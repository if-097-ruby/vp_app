class Presentation < ApplicationRecord
  belongs_to :user
  has_many :slides, dependent: :destroy
  mount_uploader :attachment, AttachmentUploader
  validates :name, length: { in: 3..40 }
  validates :attachment, presence: true
end