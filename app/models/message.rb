class Message < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  validates :en_name, presence: true, uniqueness: true
  validates :en_content, presence: true, uniqueness: true
  validates :zh_tw_name, presence: true, uniqueness: true
  validates :zh_tw_content, presence: true, uniqueness: true
  validates :zh_cn_name, presence: true, uniqueness: true
  validates :zh_cn_content, presence: true, uniqueness: true
  validates :vi_name, presence: true, uniqueness: true
  validates :vi_content, presence: true, uniqueness: true
  validates :hmn_name, presence: true, uniqueness: true
  validates :hmn_content, presence: true, uniqueness: true
end
