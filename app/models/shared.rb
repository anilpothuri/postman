# frozen_string_literal: true

class Shared < ApplicationRecord
  belongs_to :user
  belongs_to :article
end
