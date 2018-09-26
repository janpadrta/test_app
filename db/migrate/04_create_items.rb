class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :deed_id
      t.integer :variant_id

      t.timestamps
    end
  end
end
