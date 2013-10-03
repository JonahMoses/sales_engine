class Transaction

  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at,
              :engine

  def initialize(transaction_attribute, engine)
    @id                          = transaction_attribute[:id].to_i
    @invoice_id                  = transaction_attribute[:invoice_id].to_s
    @credit_card_number          = transaction_attribute[:credit_card_number].to_i
    @credit_card_expiration_date = transaction_attribute[:credit_card_expiration_date].to_s
    @result                      = transaction_attribute[:result].to_s
    @created_at                  = transaction_attribute[:created_at].to_s
    @updated_at                  = transaction_attribute[:updated_at].to_s
    @engine                      = engine
  end

  def invoice
    engine.invoice_repository.find_by_id(self.invoice_id)
  end

end
