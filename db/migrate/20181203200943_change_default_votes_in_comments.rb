class ChangeDefaultVotesInComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :votes, :integer, default: 0
  end
end
