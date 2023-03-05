class ChangeTitleToText < ActiveRecord::Migration[7.0]
def up
  change_column :notes, :title, :text
end
def down
  # This might cause trouble if you have strings longer
  # than 255 characters.
  change_column :notes, :title, :string
end
end
