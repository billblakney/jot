class AddDisplayedAtToNote < ActiveRecord::Migration[7.0]
  def change_table
    add_column :notes, :display_at, :datetime, null: false
  end
end
