class Story < ApplicationRecord
  belongs_to :member

  mount_uploader :picture, PictureUploader

  validates :text, length: { minimum: 5 , maximum: 1000 }
  validates :header , length: { minimum: 5 , maximum: 400}

  def name
    header
  end
end
