Order.transaction do
  (1..100).each do |i|
    Order.create(:name => "Zákazník #{i}", :address => "Hlavní #{i}",
                 :email => "zakaznik-#{i}@nekde.cz", :pay_type => "Dobírka")
  end
end
