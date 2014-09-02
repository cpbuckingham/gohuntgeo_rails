class Refer < ActiveRecord::Migration
  def up
    create_table :refers do |t|
      t.string :name
      t.integer :email

    end
  end

  def down
    drop_table :refers
  end
end
