class DailyQuery < ApplicationRecord

  belongs_to :user
  has_many :daily_query_options, dependent: :destroy
  has_many :options, through: :daily_query_options

  accepts_nested_attributes_for :daily_query_options, reject_if: :all_blank, allow_destroy: true

  before_destroy :destroy_options

  private

  def destroy_options
    options.each do |option|
      option.destroy
    end
  end
end
