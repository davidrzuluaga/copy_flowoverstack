class CreateVoteQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_questions do |t|
      t.references :question, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
