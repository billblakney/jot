class RenameTitleColumnToNote < ActiveRecord::Migration[7.0]
  def change
    rename_column :notes, :title, :note
  end
end
