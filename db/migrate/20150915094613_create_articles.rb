class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :contents, null: false

      t.timestamps null: false
    end
  end
end
