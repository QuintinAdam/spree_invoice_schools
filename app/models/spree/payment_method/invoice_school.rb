module Spree
  class PaymentMethod::InvoiceSchool < PaymentMethod

    def actions
      %w{capture void}
    end

    def method_type
      'invoice_school'
    end

    # Indicates whether its possible to capture the payment
    def can_capture?(payment)
      ['checkout', 'pending'].include?(payment.state)
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      payment.state != 'void'
    end

    def capture(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def cancel(response); end

    def void(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def source_required?
      false
    end

  end
end

#   payment.state = 'completed'
#   current_order.state = 'complete'
