require 'open-uri'
require 'nokogiri'
require 'pry'



url_cap_market_coin = "https://coinmarketcap.com/all/views/all/"

def name_market_coin(page)
  @name_coin = []
  page_market = Nokogiri::HTML(open(page))
  page_market.xpath('//a[@class = "currency-name-container link-secondary"]').each do |node|
      @name_coin << node.text
    end
  @name_coin
end

def get_price(page)
  @crypto_price = []
  page_crypto = Nokogiri::HTML(open(page))
  page_crypto.xpath('//a[@class="price"]').each do |node|
      @crypto_price << node.text
  end
  @crypto_price
end

def perform_mix
  get_price(url_cap_market_coin)
  name_market_coin(url_cap_market_coin)

  mix = Hash.new
  mix = @name_coin.zip(@crypto_price)

  p mix

end

perform_mix