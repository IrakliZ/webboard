class AddColumnToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :title, :string
  end
end
