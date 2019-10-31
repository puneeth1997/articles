class CreateCatagories < ActiveRecord::Migration[5.2]
  def change
    create_table :catagories do |t|
      t.text :name
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
