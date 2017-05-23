class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      
      t.string :title
      t.datetime :date
      t.datetime :created_at
      t.references :employee, foreign_key: { to_table: :users }
      t.timestamps null: false
    end
  end
end
