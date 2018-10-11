require 'open-uri'
require 'nokogiri'
require 'pry'


@assemblee_nationale = "http://www2.assemblee-nationale.fr/deputes/liste/tableau"
@accueil = "http://www2.assemblee-nationale.fr"


#récupère civilité, prénom, nom
def deputes(page) 
  @deputes = []
  page_deputes = Nokogiri::HTML(open(page))
  page_deputes.xpath('//td//a').each do |node|
      @deputes << node.text
    end
  @deputes
end

#récupère URL de fiche de chaque député
def get_all_the_urls_of_deputes(page, accueil) 
  @url_deputes = []
  page_deputes = Nokogiri::HTML(open(page))
  page_deputes.xpath('//td//a').each do |node|
    if  node.values[0].include?('/deputes')
      @url_deputes << accueil + node.values[0]
    end
  end
  @url_deputes
end

#récupère chaque email d'une fiche député
def get_the_email(page) 
  @mail_deputes = []
  fiche_deputes = Nokogiri::HTML(open(page))
  fiche_deputes.xpath('//li//a').each do |node|
    if node.values[0].include?('mailto:')
      @mail_deputes = node.values[0][7..-1]
    end
  end
   @mail_deputes
end

# crée un array du mail de chaque député
def get_email_from_url 

  @deputes_url_mail = []

  get_all_the_urls_of_deputes(@assemblee_nationale,@accueil).each do |page_url|
  @deputes_url_mail  << get_the_email(page_url)

  end
  @deputes_url_mail
end

# fait une séparation entre les noms et les prénoms de chaque député
def separation

  def separer_prenom(liste)
      @liste_prenom_deputes = []
      liste.each do |noms|
          @liste_prenom_deputes << noms.split[1]
      end
      @liste_prenom_deputes
  end

  def separer_nom(liste)
      @liste_nom_deputes = []
      liste.each do |noms|
          @liste_nom_deputes << noms.split[2]
      end
      @liste_nom_deputes
  end

  deputes(@assemblee_nationale)
  separer_prenom(@deputes)
  separer_nom(@deputes)

end


#crée un Hash qui join les noms et les prénoms dans des arrays séparés
def join_prenom_nom

  @liste_prenom_nom = @liste_prenom_deputes.zip(@liste_nom_deputes)

end

#crée un Hash qui join les noms&prénoms avec leur mail en face
def join_prenom_nom_mail

  get_email_from_url
  @liste_prenom_nom.zip(@deputes_url_mail)

end


def perform
  separation
  join_prenom_nom
  p join_prenom_nom_mail

end

perform
