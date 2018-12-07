class ChangeApproachabilityRatingForComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :approachability_rating, :integer, default: 0
  end
end
