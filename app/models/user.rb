# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: { message: lambda do |object, data|
                                             "Hey #{object.email}, #{data[:value]} is already taken."
                                           end }
  validates :role, inclusion: { in: %w[admin user] }
  has_many :likes
  has_many :articles, through: :likes
  has_many :shareds

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
