class StICML::Param
  attr_reader :name
  attr_reader :code
  attr_reader :value

  ICML_IDENT = 6

  def initialize(name: "", code: "", value: "")
    self.name = name
    self.code = code
    self.value = value
  end

  def name=(value)
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_PARAM_NAME) if value.length > 255
    @name = value
  end

  def code=(value)
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_PARAM_CODE) if value.length > 50
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_PARAM_CODE_ILLEGAL) unless value.match(/\A[a-zA-Z0-9\_]{0,51}\z/)
    @code = value
  end

  def value=(value)
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_PARAM_VALUE) if value.length > 255
    @value = value
  end

  def to_icml
    "#{''.ljust(::StICML::Param::ICML_IDENT, ' ')}<param name=\"#{@name}\" code=\"#{@code}\">#{@value}</param>"
  end

end