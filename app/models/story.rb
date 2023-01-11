class Story < ApplicationRecord
  belongs_to :member

  mount_uploader :picture, PictureUploader

  def name
    header
  end
end
