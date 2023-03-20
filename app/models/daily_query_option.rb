class DailyQueryOption < ApplicationRecord
  belongs_to :daily_query
  belongs_to :option
  accepts_nested_attributes_for :option
end
