class Option < ApplicationRecord
  validates :content, presence: true
  has_many :query_options, dependent: :destroy
  has_many :queries, through: :query_options
end
