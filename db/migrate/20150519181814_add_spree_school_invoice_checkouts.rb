class AddSpreeSchoolInvoiceCheckouts < ActiveRecord::Migration
  def change
    create_table :spree_school_invoice_checkouts do |t|
      t.string :tax_id_number
      t.string :school_name
      t.string :payer_id
      t.string :state, defualt: "unverified"
      t.datetime :refunded_at
      t.string :refund_type

      t.timestamp
    end
  end
end
