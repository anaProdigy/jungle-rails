class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :product, index: true, foreign_key: {on_delete: :cascade}
      t.references :user, index: true, foreign_key: true
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
