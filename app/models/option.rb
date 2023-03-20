class Option < ApplicationRecord
  validates :content, presence: true
  has_many :query_options, dependent: :destroy
  has_many :queries, through: :query_options
  has_many :daily_query_options, dependent: :destroy
  has_many :daily_queries, through: :daily_query_options
end
