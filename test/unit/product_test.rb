﻿require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(:title       => "Název mé knihy",
                          :description => "yyy",
                          :image_url   => "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal "musí být větší nebo rovno 0.01",
                 product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid?
    assert_equal "musí být větší nebo rovno 0.01",
                 product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(:title => "Název mé knihy",
                :description => "yyy",
                :price => 1,
                :image_url => image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
      assert new_product(name).valid?, "#{name} by nemělo být neplatné"
    end
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} by nemělo být platné"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(:title => products(:ruby).title,
                          :description => "yyy",
                          :price => 1,
                          :image_url => "fred.gif")
    assert !product.save
    assert_equal "již databáze obsahuje", 
                 product.errors[:title].join('; ')
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(:title => products(:ruby).title,
                          :description => "yyy",
                          :price => 1,
                          :image_url => "fred.gif")
    assert !product.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'),
                 product.errors[:title].join('; ')
  end

end
