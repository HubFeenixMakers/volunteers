class Member < ApplicationRecord

  def self.default_scope
    where.not(confirmed_at: nil).where.not(picture: nil)
  end

  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable, :async

  mount_uploader :picture, PictureUploader
  has_many :stories
  has_many :stories
  has_many :pictures

  validates :bio, length: { maximum: 1000 }
  validates :name , length: { minimum: 3 }

  def admin
    self.email == "torsten@villataika.fi"
  end
  def admin?
    self.email == "torsten@villataika.fi"
  end
end
