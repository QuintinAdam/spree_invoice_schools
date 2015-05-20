module Spree
  # Payment.class_eval do
  #   after_create :create_school_invoice_source, if: :payment_is_a_invoice_for_school?


  #   private

  #   def payment_is_a_invoice_for_school?
  #     payment_source.method_type == 'invoice_school'
  #   end

  #   def create_school_invoice_source
  #     source = InvoiceSchoolCheckout.create()
  #   end
  # end
end
