class Query < ApplicationRecord
    has_many :options, dependent: :destroy
end
