class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :avatar, null: false
      t.string :whatsapp, null: false
      t.string :bio, null: false
    end
  end
end
