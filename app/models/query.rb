class Query < ApplicationRecord
    
    belongs_to :user
    has_many :query_options, dependent: :destroy
    has_many :options, through: :query_options
    accepts_nested_attributes_for :query_options, reject_if: :all_blank, allow_destroy: true
    before_destroy :destroy_options

    def duplicate
        new_query = dup
        new_query.options = options.map(&:dup)
        new_query
    end    

    private
  
    def destroy_options
        options.each do |option|
            option.destroy
        end
    end
end
