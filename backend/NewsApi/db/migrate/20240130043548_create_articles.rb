class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :author
      t.datetime :publishedAt
      t.string :source
      t.string :description
      t.text :url
      t.text :urlToImage
      t.timestamps
    end
  end
end
