class AddSpreeSchoolInvoiceCheckouts < ActiveRecord::Migration
  def change
    create_table :spree_invoice_school_checkouts do |t|
      t.string :tax_id_number
      t.string :school_name
      t.string :state, defualt: "completed"

      t.timestamps null: false
    end
  end
end
