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

end
