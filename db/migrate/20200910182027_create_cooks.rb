class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.string  :cook_name
      t.string  :email
      t.timestamps
    end
  end
end
