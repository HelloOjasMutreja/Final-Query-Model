class Option < ApplicationRecord
  has_many :query_options, dependent: :destroy
  has_many :queries, through: :query_options
end
