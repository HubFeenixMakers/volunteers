class Picture < ApplicationRecord
  belongs_to :member

  mount_uploader :picture, PictureUploader

  validates :text, length: { maximum: 80 }
  validates :happened, presence: true

end
