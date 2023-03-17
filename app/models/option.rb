class Option < ApplicationRecord
  belongs_to :query
  has_many :query_options, dependent: :destroy
  has_many :queries, through: :query_options
end
