class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.timestamp :published
      t.text :description
      t.string :enc_url
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
