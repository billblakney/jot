class RenameBodyColumnToDetail < ActiveRecord::Migration[7.0]
  def change
    rename_column :notes, :body, :detail
  end
end
