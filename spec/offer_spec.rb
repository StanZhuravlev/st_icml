require 'spec_helper'

RSpec.describe ::StICML::Offer do

  describe "::StICML::Offer" do
    it "Корректные значения после конструктора" do
      item = ::StICML::Offer.new(id: 43, productId: 546, quantity: 2)
      puts item.to_icml
    end

    it "Корректные значения после конструктора" do
      item = ::StICML::Offer.new(id: 43, productId: 546, quantity: 2)
      item.url = "https://v-screen.ru"
      item.price = 4200.00
      item.purchasePrice = 1890.00
      puts item.to_icml
    end

  end
end