class Story < ApplicationRecord
  belongs_to :member

  mount_uploader :picture, PictureUploader

  validates :text, length: { maximum: 1000 }
  validates :header , length: { minimum: 5 }

  def name
    header
  end
end
