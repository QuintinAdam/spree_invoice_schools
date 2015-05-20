module Spree
  CheckoutController.class_eval do
    # Copies the update method
    def update
      if @order.update_from_params(params, permitted_checkout_attributes, request.headers.env)

        # other thing different
        create_source_for_school_invoice if checking_out_useing_school_invoice?

        @order.temporary_address = !params[:save_user_address]
        unless @order.next
          flash[:error] = @order.errors.full_messages.join("\n")
          redirect_to checkout_state_path(@order.state) and return
        end

        if @order.completed?
          @current_order = nil
          flash.notice = Spree.t(:order_processed_successfully)
          flash['order_completed'] = true
          redirect_to completion_route
        else
          redirect_to checkout_state_path(@order.state)
        end
      else
        render :edit
      end
    end

    private

    def checking_out_useing_school_invoice?
      params[:state] == "payment" && params['order']['payments_attributes'][0]['payment_method_id'].try(:to_i) == @invoice_payment = Spree::PaymentMethod.find_by_type('Spree::PaymentMethod::InvoiceSchool').id
    end

    def create_source_for_school_invoice
      if newest_payment = @order.payments.last
        newest_payment.source = InvoiceSchoolCheckout.create(school_name: params['order']['payments_attributes'][0]['source_attributes']['school_name'], tax_id_number: params['order']['payments_attributes'][0]['source_attributes']['tax_id_number'])
        newest_payment.save
      end
    end
  end
end
