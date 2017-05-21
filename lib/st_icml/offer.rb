class StICML::Offer
  attr_reader :data
  attr_reader :categoryId
  attr_reader :param
  attr_reader :unit

  ICML_IDENT = 4

  KEYS_OFFER_TAG = [:id, :productId, :quantity]

  KEYS_OFFER = [:productActivity, :url, :price, :purchasePrice, :picture,
                :name, :xmlId, :productName, :vendor, :vatRate]

  def initialize(opts = {})
    @data = Hash.new
    (::StICML::Offer::KEYS_OFFER_TAG + ::StICML::Offer::KEYS_OFFER).each do |key|
      @data[key] = opts.fetch(key, nil)
    end
    @categoryId = Array.new
    @param = Array.new
    @unit = Array.new

    validate_offer(false)
  end

  def method_missing(m, *args, &block)
    key = m.to_s.chomp('=').to_sym
    if @data.has_key?(key)
      if m.to_s.match(/\=\z/)
        @data[key] = args.first.to_s
        validate_offer(false)
      else
        @data[key]
      end
    else
      raise ArgumentError.new("Method `#{m}` doesn't exist.")
    end
  end

  def to_icml
    validate_offer(true)
    out = Array.new
    out << get_offer_title
    ::StICML::Offer::KEYS_OFFER.each do |key|
      out << get_icml_line("#{key.to_s}=#{@data[key]}") unless @data[key].nil?
    end
    @categoryId.each do |one|
      out << get_icml_line("<categoryId>#{one}</categoryId>")
    end
    out << get_icml_line("</offer>", 2)
    out.join("\n")
  end

  private

  def get_offer_title
    out = Array.new
    out << "id=\"#{@data[:id]}\"" unless @data[:id].nil?
    out << "productId=\"#{@data[:productId]}\"" unless @data[:productId].nil?
    out << "quantity=\"#{@data[:quantity]}\"" unless @data[:quantity].nil?
    get_icml_line("<offer #{out.join(' ')}>".gsub(/offer\s{1,5}\>/, 'offer>'), 2)
  end

  def get_icml_line(line, shift = 0)
    "#{''.ljust(::StICML::Offer::ICML_IDENT - shift, ' ')}#{line}"
  end

  def validate_offer(is_full)
    if is_full
      validate_required
      validate_duplicates
    end
    validate_quantity
    validate_product_activity
    validate_url
    validate_price
    validate_purchase_price
    validate_picture
    validate_name
    validate_product_name
    validate_xml_id
    validate_vendor
  end

  # Обязательными являются два поля: id и productId
  def validate_required
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_NO_ID) if @data[:id].nil?
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_NO_PRODUCT_ID) if @data[:productId].nil?
  end

  # Проверка, что два offers не имеют одинаковых id. Последствия этого могут быть непредсказуемые
  def validate_duplicates
    ObjectSpace.each_object(StICML::Offer) do |offer|
      if offer != self
        raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_ID_DUPLICATE) if offer.id == @data[:id]
      end
    end
  end

  def validate_quantity
    return if @data[:quantity].nil?
    @data[:quantity] = @data[:quantity].to_f.round(3)
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_QUANTITY) if @data[:quantity] > 99_999_999
  end

  def validate_product_activity
    return if @data[:productActivity].nil?
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_PRODUCT_ACTIVITY) unless ['Y', 'N'].include?(@data[:productActivity])
  end

  def validate_url
    return if @data[:url].nil?
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_URL) if @data[:url].length > 2000
  end

  def validate_price
    return if @data[:price].nil?
    @data[:price] = @data[:price].to_f.round(2)
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_PRICE) if @data[:price] > 99_999_999
  end

  def validate_purchase_price
    return if @data[:purchase_price].nil?
    @data[:purchase_price] = @data[:purchase_price].to_f.round(2)
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_PURCHASE_PRICE) if @data[:purchase_price] > 99_999_999
  end

  def validate_picture
    return if @data[:picture].nil?
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_PICTURE) if @data[:picture].length > 2000
  end

  def validate_name
    return if @data[:name].nil?
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_NAME) if @data[:name].length > 255
  end

  def validate_product_name
    return if @data[:productName].nil?
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_PRODUCT_NAME) if @data[:productName].length > 2000
  end

  def validate_xml_id
    return if @data[:xmlId].nil?
    @data[:xmlId] = @data[:xmlId].to_s
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_XML_ID) if @data[:xmlId].length > 255
  end

  def validate_vendor
    return if @data[:vendor].nil?
    raise StICML::Error.new(::StICML::ResponseCodes::ERR_OFFER_VENDOR) if @data[:vendor].length > 255
  end

end

