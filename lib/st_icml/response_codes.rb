module StICML::ResponseCodes
  SUCCESS = 0
  ERR_PARAM_NAME = 1 # Название параметра товара; Максимальная длина 255 символов;
  ERR_PARAM_CODE = 2 # Максимальная длина кода 50 символов. Допустимые символы: a-Z0-9_
  ERR_PARAM_CODE_ILLEGAL = 3 #
  ERR_PARAM_VALUE = 4 # Длина значения свойства товара не должна превышать 255 символов.
  ERR_OFFER_NO_ID = 5 # Для offer должен быть указан id
  ERR_OFFER_NO_PRODUCT_ID = 6 # Для offer должен быть указан productId
  ERR_OFFER_ID_DUPLICATE = 7 # У двух offer-ов одинаковые id
  ERR_OFFER_QUANTITY = 8 # Ошибка валидации поля quantity в offer
  ERR_OFFER_PRODUCT_ACTIVITY = 9 # productActivity должен строго принимать значения N или Y
  ERR_OFFER_URL = 10 # Длина поля url должна быть не более 2000 символов
  ERR_OFFER_PRICE = 11 # Поле не должно быть больше 99_999_999
  ERR_OFFER_PURCHASE_PRICE = 12 # Поле не должно быть больше 99_999_999
  ERR_OFFER_PICTURE = 13 # Длина поля picture должна быть не более 2000 символов
  ERR_OFFER_NAME = 14 # Длина поля name должна быть не более 255 символов
  ERR_OFFER_PRODUCT_NAME = 15 # Длина поля product_name должна быть не более 255 символов
  ERR_OFFER_XML_ID = 16 # Длина поля xmlId должна быть не более 255 символов
  ERR_OFFER_VENDOR = 17 # Длина поля vendor должна быть не более 255 символов
end
