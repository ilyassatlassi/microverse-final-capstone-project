class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :image
      t.string :name
      t.string :specialization
      t.integer :consultation_fee
      t.string :hospital
      t.boolean :availability
      t.string :description
      t.string :facebook
      t.string :twitter
      t.string :instagram

      t.timestamps
    end
  end
end
