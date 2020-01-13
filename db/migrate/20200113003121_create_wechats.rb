class CreateWechats < ActiveRecord::Migration[5.1]
  def change
    create_table :wechats do |t|
      t.string :juhe_id
      t.string :title
      t.string :source
      t.string :url

      t.timestamps
    end
    
    add_index :wechats, :juhe_id
  end
end
