class RenameNoteColumnToText < ActiveRecord::Migration[7.0]
  def change
    rename_column :notes, :note, :text
  end
end
