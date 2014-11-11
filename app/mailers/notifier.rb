class Notifier < ActionMailer::Base
  default :from => 'Michal Ruby <depot@nekde.cz>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order

    mail :to => order.email, 
         :subject => 'Potvrzení objednávky z Pragmatické knihovny'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order

    mail :to => order.email, 
         :subject => 'Objednávka z Pragmatické knihovny byla odeslána'
  end
end
