credit_card = ActiveMerchant::Billing::CreditCard.new(
  :number => '4111111111111111',
  :month => '8',
  :year => '2009',
  :first_name => 'Martin',
  :last_name => 'Loutka',
  :verification_value => '123'
)

puts "Je #{credit_card.number} platné? #{credit_card.valid?}"
