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
    raise ERR_PARAM_NAME if value.length > 255
    @name = value
  end

  def code=(value)
    raise ERR_PARAM_CODE if value.length > 50
    # raise ERR_PARAM_CODE_ILLEGAL unless value.match(/\A[a-Z0-9\_]{1,51}\z/)
    @code = value
  end

  def value=(value)
    raise ERR_PARAM_VALUE if value.length > 255
    @value = value
  end

  def to_icml
    "#{''.ljust(::StICML::Param.ICML_IDENT, ' ')}<param name=\"#{@name}\" code=\"#{@code}\">#{@value}</param>"
  end

end