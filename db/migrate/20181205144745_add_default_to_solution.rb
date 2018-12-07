class AddDefaultToSolution < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :solution, :boolean, default: false
  end
end
