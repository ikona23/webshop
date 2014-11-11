require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    mail = Notifier.order_received(orders(:one))
    assert_equal "Potvrzení objednávky z Pragmatické knihovny", mail.subject
    assert_equal ["kuba@nekde.cz"], mail.to
    assert_equal ["depot@nekde.cz"], mail.from
    assert_match /1 x Začínáme programovat v Ruby on Rails/, mail.body.encoded
  end

  test "order_shipped" do
    mail = Notifier.order_shipped(orders(:one))
    assert_equal "Objednávka z Pragmatické knihovny byla odeslána", mail.subject
    assert_equal ["kuba@nekde.cz"], mail.to
    assert_equal ["depot@nekde.cz"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Začínáme programovat v Ruby on Rails<\/td>/, mail.body.encoded
  end
end
