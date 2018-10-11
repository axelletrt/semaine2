
require 'open-uri'
require 'nokogiri'
require 'pry'

@vaureal = 'http://annuaire-des-mairies.com/95/vaureal.html'
@home_page = 'http://www.annuaire-des-mairies.com/'
@val_doise = 'http://www.annuaire-des-mairies.com/val-d-oise.html'


def get_the_email_of_a_town_hall_from_its_webpage(page)
	email_town_hall = ''

	page_town_hall = Nokogiri::HTML(open(page))
	page_town_hall.xpath('//td').each do |node|
		email_town_hall = node.text if node.text.include?('@')
	end
  
	email_town_hall
end


def get_all_the_urls_of_val_doise_town_halls(page, home_url)
	town_halls = Array.new

	url_town_halls = Nokogiri::HTML(open(page))
	url_town_halls.xpath('//a[@class="lientxt"]').each do |node|
		if node.values[1][0].include?('.')
      town_halls << home_url + node.values[1][2..-1]
    end
  end

  town_halls
end


def get_all_the_town_halls_names(page)
	name_town_halls = Array.new

	url_town_halls = Nokogiri::HTML(open(page))
	url_town_halls.xpath('//a[@class="lientxt"]').each do |node|
  	name_town_halls << node.text.downcase.capitalize if node.values[1].include?('./95')
  end

  name_town_halls
end


def get_all_town_halls_emails(page)
  county = ''
  email_town_halls = Array.new

  home_url = Nokogiri::HTML(open(page))
  home_url.xpath('//a').each do |node|
    county = page + node.values[1] if node.text.include?("95 | Val-d'Oise")
  end

  get_all_the_urls_of_val_doise_town_halls(county, page).each do |url|
    email_town_halls << get_the_email_of_a_town_hall_from_its_webpage(url)
  end
  email_town_halls
end

def perform
# get_the_email_of_a_town_hall_from_its_webpage(@vaureal)
# get_all_the_town_halls_names(@val_doise)
# get_all_the_urls_of_val_doise_town_halls(@val_doise, @home_page)
p get_all_town_halls_emails(@home_page)
end

perform