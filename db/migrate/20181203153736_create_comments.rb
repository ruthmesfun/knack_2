class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.references :question, foreign_key: true
      t.boolean :solution
      t.integer :votes
      t.text :statement
      t.integer :approachability_rating

      t.timestamps
    end
  end
end
