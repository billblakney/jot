class AddPinToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :pin, :boolean, default: false, null: false
  end
end
