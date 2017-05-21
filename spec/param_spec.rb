require 'spec_helper'

RSpec.describe ::StICML::Param do

  describe "::StICML::Param" do
    it "Корректные значения после конструктора" do
      item = ::StICML::Param.new
      item.name = 'Размер'
      item.code = 'size'
      item.value = 'Большой размер'
      expect(item.to_icml).to include('<param name="Размер" code="size">Большой размер</param>')
    end

    it "Корректные значения в конструкторе" do
      item = ::StICML::Param.new(name: 'Размер', code: 'size', value: 'Большой размер')
      expect(item.to_icml).to include('<param name="Размер" code="size">Большой размер</param>')
    end

    it "Корректные значения частично в конструкторе, частично нет" do
      item = ::StICML::Param.new(name: 'Размер', code: 'size')
      item.value = 'Большой размер'
      expect(item.to_icml).to include('<param name="Размер" code="size">Большой размер</param>')
    end

    it "Ошибка - слишком длинный code" do
      item = ::StICML::Param.new(name: 'Размер')
      item.value = 'Большой размер'
      expect { item.code = 'test '.ljust(56, ' ') }.to raise_error
    end

    it "Ошибка - слишком длинный name" do
      item = ::StICML::Param.new
      item.value = 'Большой размер'
      item.code = 'size'
      expect { item.name = 'test '.ljust(300, ' ') }.to raise_error
    end

    it "Ошибка - неправильные символы в code" do
      item = ::StICML::Param.new(name: 'Размер')
      item.value = 'Большой размер'
      expect { item.code = 'Руский_код' }.to raise_error
    end


  end

end