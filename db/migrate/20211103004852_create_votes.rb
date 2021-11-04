class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :candidate
      t.timestamps
    end
  end
end
