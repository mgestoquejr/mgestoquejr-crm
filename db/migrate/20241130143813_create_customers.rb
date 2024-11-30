class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_enum :stage, [ "closed", "contacted", "diligence", "lead", "rejected" ]

    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :phone
      t.string :company
      t.integer :probability, default: 0, null: false

      t.enum :stage, enum_type: "stage", default: "contacted", null: false

      t.timestamps
    end
  end
end
