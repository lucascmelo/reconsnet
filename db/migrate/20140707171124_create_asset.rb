class CreateAsset < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :description
      t.attachment :file

      t.integer :assetable_id
      t.string :assetable_type

      t.timestamps
    end

    add_index :assets, [:assetable_type, :assetable_id]
    add_index :assets, :name
  end
end
