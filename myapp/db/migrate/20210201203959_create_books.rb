class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :genre
      t.decimal :price
      t.string :published_date
      t.timestamps
    end
  end
end
