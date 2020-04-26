class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question_name, null: false, default: ""
      t.integer :user_id, null: false
      
      t.timestamps
    end
  end
end
