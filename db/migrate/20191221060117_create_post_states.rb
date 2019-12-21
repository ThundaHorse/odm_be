class CreatePostStates < ActiveRecord::Migration[6.0]
  def change
    create_table :post_states do |t|
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0
      t.integer :post_id

      t.timestamps
    end
  end
end
