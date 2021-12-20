class User < ApplicationRecord
  has_and_belongs_to_many :projects
  has_one_attached :image
  after_commit :add_default_avatar, on: %i[create update]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true

  private
  def add_default_avatar
    unless image.attached?
      image.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_avatar.jpg'
          )
        ),
        filename: 'default_avatar.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
