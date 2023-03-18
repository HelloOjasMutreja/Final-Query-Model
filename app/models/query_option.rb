class QueryOption < ApplicationRecord
    belongs_to :query
    belongs_to :option
    accepts_nested_attributes_for :option
end