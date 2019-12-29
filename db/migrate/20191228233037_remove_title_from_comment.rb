class RemoveTitleFromComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :title, :string
    add_column :comments, :user, :string
  end
end
