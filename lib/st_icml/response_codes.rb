module StICML::ResponseCodes
  SUCCESS = 0
  ERR_PARAM_NAME = 1 # Название параметра товара; Максимальная длина 255 символов;
  ERR_PARAM_CODE = 2 # Максимальная длина кода 50 символов. Допустимые символы: a-Z0-9_
  ERR_PARAM_CODE_ILLEGAL = 3 #
  ERR_PARAM_VALUE = 4 # Длина значения свойства товара не должна превышать 255 символов.
end