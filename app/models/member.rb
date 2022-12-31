class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable

  mount_uploader :picture, PictureUploader

  def admin
    true
  end
  def admin?
    true
  end
end
