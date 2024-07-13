class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title, null: false
      t.string :image_url
      t.text :html_content
      t.string :tags, array: true

      t.timestamps
    end
  end
end
