class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do | t |
      t.string :name
      t.string :age
      t.string :cpf, unique: true
      t.string :voter_registration
      t.string :city
      t.string :state
      t.boolean :voted

      t.timestamps
    end
  end
end
