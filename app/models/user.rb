class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments
  has_many :likes

  has_attached_file :avatar, default_url: "default_profile.jpg", :styles => {:thumb => "100x100", :medium => "300x300", :small => "50x50"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/

  # validates_integrity_of :avatar
  # validates_processing_of :avatar
  #
  # private
  # def avatar_size_validation
  #   errors[:avatar]<<"should be less than 500KB" if avatar.size>0.5.megabytes
  # end
  # has_one_attached :avatar
  # after_commit :add_default_avatar, on: :update
  # def avatar_thumbnail
  #   if avatar.attached?
  #   avatar.variant(resize: "150x150!").processed
  #   else
  #     "/default_profile.jpg"
  #   end
  # end
  #
  # private
  # def add_default_avatar
  #   unless avatar.attached?
  #     avatar.attach(
  #       io: File.open(
  #         Rails.root.join(
  #           'app', 'assets', 'images', 'default_profile.jpg'
  #         )
  #       ),
  #       filename: 'default_profile.jpg',
  #       content_type: 'image/jpg'
  #     )
  #   end
  # end
end
