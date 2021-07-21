class Faq < ApplicationRecord
  has_rich_text :en_answer
  has_rich_text :zh_tw_answer
  has_rich_text :zh_cn_answer
  has_rich_text :hmn_answer
  has_rich_text :vi_answer
  extend FriendlyId
  friendly_id :en_question, use: :slugged
  scope :filter_by_category, -> (category) { where category: category }
  scope :filter_by_search, -> (search) { where("en_question ilike ?", "%#{search}%").or(
                                         where("zh_tw_question ilike ?", "%#{search}%")).or(
                                         where("zh_cn_question ilike ?", "%#{search}%")).or(
                                         where("vi_question ilike ?", "%#{search}%")).or(
                                         where("hmn_question ilike ?", "%#{search}%"))
                                       }
end
