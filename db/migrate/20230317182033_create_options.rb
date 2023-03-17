class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.references :query, null: false, foreign_key: true
      t.string :answer

      t.timestamps
    end
  end
end
