class AddNumquestionsToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :numquestions, :integer, :default => 0
  end
end
