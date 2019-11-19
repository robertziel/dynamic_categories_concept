class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.references :category, foreign_key: true, index: true

      t.timestamps
    end
  end
end
