class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :ques_name
      t.integer :qno
      t.string :optionA
      t.boolean :flagA, default: false
      t.string :optionB
      t.boolean :flagB, default: false
      t.string :optionC
      t.boolean :flagC, default: false
      t.string :optionD
      t.boolean :flagD, default: false
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
