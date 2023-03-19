class Blog < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :title, :content, :sub_title, presence: true
end
