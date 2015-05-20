module Spree
  CheckoutController.class_eval do
    before_action :create_source_for_school_invoice, only: [:update], if: :checking_out_useing_school_invoice?

    private

    def checking_out_useing_school_invoice?
      params['payment_source'] && params['order']['payments_attributes'][0]['payment_method_id'].try(:to_i) == Spree::PaymentMethod.find_by_type('Spree::PaymentMethod::InvoiceSchool').id
    end

    def create_source_for_school_invoice
      # raise 'the roof'
    end
  end
end
