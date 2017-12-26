class CreateSodas < ActiveRecord::Migration[5.1]
  def change
    create_table :sodas do |t|
      t.string :name
      t.string :flavor
      t.boolean :carbonated
      t.string :price

      t.timestamps
    end
  end
end
