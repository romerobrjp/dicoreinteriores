class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :cpf
      t.string :phone1
      t.string :phone2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :street
      t.string :street_number
      t.string :street_complement
      t.string :type

      t.timestamps null: false
    end
  end
end