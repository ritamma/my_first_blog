class Article < ApplicationRecord
  include Visible
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :header_image


  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 2 }


end






