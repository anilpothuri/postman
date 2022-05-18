# frozen_string_literal: true

class Image < ApplicationRecord
  validates :picture, presence: true
  belongs_to :article, dependent: :destroy
  mount_uploader :picture, PictureUploader
end
