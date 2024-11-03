class CreateMenuItems < ActiveRecord::Migration[7.2]
  def change
    create_table :menu_items do |t|
      t.string :title
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end