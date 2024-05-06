class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
