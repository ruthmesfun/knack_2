class AddHelpfulFilterToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :helpful_filter, :boolean, default: false
  end
end
