class CreateCommonBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :common_boards do |t|
      t.string :name
      t.string :title
      t.text :body
      t.string :user_id

      t.timestamps
    end
  end
end
