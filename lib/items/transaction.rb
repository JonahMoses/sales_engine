class Transaction

  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at

  def initialize(transaction_attribute)
    @id                          = transaction_attribute[:id]
    @invoice_id                  = transaction_attribute[:invoice_id]
    @credit_card_number          = transaction_attribute[:credit_card_number]
    @credit_card_expiration_date = transaction_attribute[:credit_card_expiration_date]
    @result                      = transaction_attribute[:result]
    @created_at                  = transaction_attribute[:created_at]
    @updated_at                  = transaction_attribute[:updated_at]
  end

  def invoice
    InvoiceRepo.new.find_by_id(self.invoice_id)
  end

end
