class AddPrefsToUser < ActiveRecord::Migration
  def change
    add_column :users, :prefs, :string
  end
end
