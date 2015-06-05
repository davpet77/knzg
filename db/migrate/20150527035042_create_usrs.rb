class CreateUsrs < ActiveRecord::Migration
  def change
    create_table :usrs do |t|
      t.string :usr_name
      t.string :usr_email
      t.string :first_name
      t.string :last_name
      t.string :salt
      t.string :password_hash
      t.string :image_url
    end
  end
end
