require 'spec_helper'

RSpec.describe ::StICML::Offer do

  describe "::StICML::Offer" do
    it "Корректные значения после конструктора" do
      item = ::StICML::Offer.new(id: 43, productId: 546, quantity: 2)
    end

    it "Корректные значения после конструктора" do
      item = ::StICML::Offer.new(id: 43, productId: 546, quantity: 2)
      item.url = "https://v-screen.ru"
      item.price = 4200.00
      item.purchasePrice = 1890.00
      item.categoryId << 3
      item.picture = "https://v-screen.ru/image.jpg"
      item.name = "Имя товара"
      item.xmlId = 82
      item.productName = "Еще какое-то имя продукта"
      item.vendor = "V-Screen.ru"
      item.vatRate = 'none'
    end

    it "Ошибка - не заданы id или productId" do
      item = ::StICML::Offer.new(id: 43)
      expect { item.to_icml }.to raise_error
    end

    it "Ошибка - не заданы id или productId" do
      item1 = ::StICML::Offer.new(id: 43, productId: 82)
      item2 = ::StICML::Offer.new(id: 43, productId: 176)
      expect { item1.to_icml }.to raise_error
      expect { item2.to_icml }.to raise_error
    end

    it "ТЕСТ" do
      item = ::StICML::Offer.new(id: 45, productId: 546, quantity: 2.54544556)
      item.categoryId << 2
      item.categoryId << 35
      puts item.to_icml
    end


  end
end