class AddOrganizationToPost < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :organization, null: false, foreign_key: true
  end
end
