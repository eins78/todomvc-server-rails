class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :title, null: false, limit: 140
      t.boolean :completed, null: false, default: false
      t.timestamps null: false
    end
  end
end
