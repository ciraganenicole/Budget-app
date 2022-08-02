class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :category_transancts, dependent: :destroy
  has_many :transancts, through: :category_transancts, dependent: :destroy

  validates_presence_of :user
  validates :name, presence: true, length: { maximum: 30 }
  validates :icon, presence: true
end
