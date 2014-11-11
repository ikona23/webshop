def test_generates
  assert_generates("/", :controller => "store", :action => "index")
  assert_generates("/products",
                   { :controller => "products", :action => "index"})
  assert_generates("/line_items",
                   { :controller => "line_items", :action => "create",
                     :product_id => "1"},
                   {:method => :post}, { :product_id => "1"})
end

def test_recognizes
  # Ov���, zda se generuje v�choz� akce index 
  assert_recognizes({"controller" => "store", "action" => "index"}, "/")

  # Ov��� sm�rov�n� na akci
  assert_recognizes({"controller" => "products", "action" => "index"},
                    "/products")

  # A sm�rov�n� s parametrem
  assert_recognizes({"controller" => "line_items",
                     "action" => "create",
                     "product_id" => "1" },
                    {:path => "/line_items", :method => :post},
                    {"product_id" => "1"})
end

def test_routing
  assert_routing("/", :controller => "store", :action => "index")
  assert_routing("/products", :controller => "products", 
                 :action => "index")
  assert_routing({:path => "/line_items", :method => :post},
                 { :controller => "line_items", :action => "create",
                 :product_id => "1"},
                 {}, { :product_id => "1"})
end
