class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :description
      t.string :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
