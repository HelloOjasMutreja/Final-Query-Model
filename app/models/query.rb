class Query < ApplicationRecord
    belongs_to :user
    has_many :query_options, dependent: :destroy
    has_many :options, through: :query_options
    accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
end
