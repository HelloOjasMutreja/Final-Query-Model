class RenameQuestionToTitleInQuery < ActiveRecord::Migration[7.0]
  def change
    rename_column :queries, :question, :title
  end
end
