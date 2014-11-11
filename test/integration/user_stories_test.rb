require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

  # Uživatel přejde na indexovou stránku obchodu. Vybere produkt 
  # a přidá jej do svého košíku. Potom přejde k objednávce a vyplní 
  # své údaje v objednávkovém formuláři. Při odeslání formuláře se 
  # v databázi vytvoří objednávka obsahující zadané údaje společně 
  # s jedinou položkou odpovídající produktu, který přidal do košíku. 
  # Při přijetí objednávky se odešle e-mail potvrzující provedený nákup.

  test "buying a product" do
    LineItem.delete_all
    Order.delete_all
    ruby_book = products(:ruby)

    get "/"
    assert_response :success
    assert_template "index"

    xml_http_request :post, '/line_items', :product_id => ruby_book.id
    assert_response :success

    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal ruby_book, cart.line_items[0].product

    get "/orders/new"
    assert_response :success
    assert_template "new"

    post_via_redirect "/orders",
                      :order => { :name => "David Slonek",
                      :address => "Hlavní ul. 123",
                      :email => "david@nekde.cz",
                      :pay_type => "Dobírka" }

    assert_response :success
    assert_template "index"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size

    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]

    assert_equal "David Slonek", order.name
    assert_equal "Hlavní ul. 123", order.address
    assert_equal "david@nekde.cz", order.email
    assert_equal "Dobírka", order.pay_type

    assert_equal 1, order.line_items.size
    line_item = order.line_items[0]
    assert_equal ruby_book, line_item.product

    mail = ActionMailer::Base.deliveries.last
    assert_equal ["david@nekde.cz"], mail.to
    assert_equal 'Michal Ruby <depot@nekde.cz>', mail[:from].value
    assert_equal "Potvrzení objednávky z Pragmatické knihovny", mail.subject
  end
end
