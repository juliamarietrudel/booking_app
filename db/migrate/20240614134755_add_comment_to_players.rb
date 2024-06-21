class AddCommentToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :comment, :string
  end
end
