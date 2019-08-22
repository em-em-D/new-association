class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :eventname
      t.string :location
      t.string :date

      t.timestamps
    end
  end
end
