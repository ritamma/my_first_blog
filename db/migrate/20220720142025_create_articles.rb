class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      # t.references :user, null: false, foreign_key: true, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
