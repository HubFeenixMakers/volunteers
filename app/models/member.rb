class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable

  mount_uploader :picture, PictureUploader
  has_many :stories

  def admin
    self.email == "torsten@villataika.fi"
  end
  def admin?
    self.email == "torsten@villataika.fi"
  end
end
