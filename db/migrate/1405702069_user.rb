class User < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :count
    end
  end

  def down
    drop_table :users
  end
end

