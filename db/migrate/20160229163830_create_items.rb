class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.date :date_completed
      t.string :priority
      t.text :description

      t.timestamps null: false
    end
  end
end
