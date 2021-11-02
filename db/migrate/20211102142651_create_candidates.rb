class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :code
      t.integer :category
      t.string :city
      t.string :state
      t.string :photo
      t.timestamps
    end
  end
end
