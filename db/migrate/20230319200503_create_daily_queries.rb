class CreateDailyQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_queries do |t|
      t.references :query, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
