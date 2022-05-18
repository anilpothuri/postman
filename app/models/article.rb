# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 10 }
  validates :description, presence: true, length: { maximum: 1000 }
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :shareds, dependent: :destroy
  has_one :image, dependent: :destroy
  # has_many:users, through: :shareds
  def liked?(user)
    !!likes.find { |like| like.user_id == user.id }
  end

  def self.title_matches(param)
    matches('title', param)
  end

  def self.search(param)
    param.strip!
    match_results = title_matches(param).uniq
    return nil if match_results.empty?

    match_results
  end

  def self.matches(field_name, param)
    where("#{field_name} like ?", "%#{param}%")
  end
end
