class AddAvatarColorToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :avatar_color, :string
  end
end
