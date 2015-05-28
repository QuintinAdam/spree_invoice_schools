class AddContactInfoToSchoolInvoiceCheckouts < ActiveRecord::Migration
  def up
    add_column :spree_invoice_school_checkouts, :contact_name, :string
    add_column :spree_invoice_school_checkouts, :contact_email, :string
  end

  def down
    remove_column :spree_invoice_school_checkouts, :contact_name
    remove_column :spree_invoice_school_checkouts, :contact_email
  end
end

