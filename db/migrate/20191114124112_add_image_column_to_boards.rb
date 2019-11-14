class AddImageColumnToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :image, :string
  end
end
