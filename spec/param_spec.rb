require 'spec_helper'

RSpec.describe ::StICML::Param do

  describe "::StICML::Param" do
    it "Корректные значения после конструктора" do
      item = ::StICML::Param.new
      item.name = 'Размер'
      item.code = 'size'
      item.value = 'Большой размер'
      expect(item.to_icml).to include('param\sname\="Размер"')
    end
  end

end