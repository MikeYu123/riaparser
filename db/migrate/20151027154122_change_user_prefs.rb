class ChangeUserPrefs < ActiveRecord::Migration
  def change
    change_column :users, :prefs, :text, default: ""
  end
end
