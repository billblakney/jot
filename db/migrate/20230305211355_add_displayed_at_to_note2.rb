class AddDisplayedAtToNote2 < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :display_at, :datetime
  end
end
