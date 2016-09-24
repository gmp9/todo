class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :date
      t.string :item
      t.string :status

      t.timestamps null: false
    end
  end
end
