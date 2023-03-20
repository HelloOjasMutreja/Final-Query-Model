class CreateDailyQueryOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_query_options do |t|
      t.references :daily_query, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
