# frozen_string_literal: true

module Zayef
  class Generator
    # Moroccan first names (authentic and common) - EXTENDED LIST
    MOROCCAN_FIRST_NAMES = %w[
      Ayoub Youssef Mohamed Ahmed Omar Hassan Ali Khalid Rachid
      Abdelkader Abdelmoumen Abdelhak Abdelaziz Abdelouahed
      Mustapha Brahim Reda Karim Anas Adil Yassine Nabil
      Said Ismail Jamal Saad Soufiane Hamza Bilal Mehdi
      Younes Ilyas Zakaria Ilyesse Tarik Noureddine Abdelilah
      Mohammed Brahim Idriss Abdeljalil Abdelghani Abdelmajid
      Fatima Zahra Aicha Khadija Malika Noura Salma Imane
      Amina Soukaina Kawtar Houda Naima Hanane Latifa Zineb
      Jamila Zakia Samira Nadia Farida Rachida Hakima
      Laila Leila Hind Sana Sanaa Leila Sabah Meryem
      Karima Fatiha Najat Hayat Hayat Rabia Asmaa
      Nouria Badia Bahia Faiza Widad Wafa Asma
      Rahma Safia Halima Abla Basma Loubna Nouha
      Safaa Najwa Najiba Mouna Mounia Raja Rajaa
      Sabah Sabah Racha Racha Rima Rima Lina Lina
      Sara Sarah Yasmina Yasmeen Lamia Lamya
    ].freeze

    # Moroccan last names (authentic family names) - EXTENDED LIST
    MOROCCAN_LAST_NAMES = [
      "Alaoui", "Bennani", "El Fassi", "Idrissi", "Kabbaj", "Lamrani", "Mansouri",
      "Benjelloun", "Chakir", "El Idrissi", "Haddouchi", "Kettani", "Laraki",
      "Belhaj", "Belkadi", "Benkirane", "Benchekroun", "Benabdellah",
      "Cherkaoui", "El Moutawakil", "El Amrani", "El Ouafi", "El Bachiri",
      "Benali", "Benmansour", "Benhassan", "Benbrahim", "Benmoussa",
      "El Khadiri", "El Yousfi", "El Haddadi", "El Kabbaj", "El Mansouri",
      "Chraibi", "Berrada", "El Amraoui", "El Haouzi", "El Ouazzani",
      "Tazi", "Alaoui", "Bennouna", "El Glaoui", "Bouazza",
      "Bouabid", "Bouazza", "El Azzouzi", "El Arrousi",
      "El Malki", "El Mansouri", "El Ouardi", "El Ouazzani",
      "Benabbou", "Benabdeljalil", "Benachour", "Benadada",
      "Benallal", "Benamara", "Benamghar", "Benanou",
      "Benbachir", "Benbarka", "Benbouazza", "Benbrahim",
      "Benchekroun", "Bendaoud", "Bendriss", "Benfares",
      "Benhaddou", "Benhamou", "Benharbit", "Benjelloun",
      "Benkirane", "Benmoha", "Benmoussa", "Bennani",
      "Bennouna", "Benomar", "Benouhoud", "Bensalem",
      "Benslimane", "Bentaleb", "Berada", "Berrada",
      "Bouachrine", "Bouazza", "Bouazzati", "Boudraa",
      "Boufous", "Bouhaddou", "Bouhlal", "Boujemaa",
      "Boukhalef", "Boukhris", "Boulaich", "Boulahfa",
      "Boumakh", "Boumediene", "Bounaim", "Bououid",
      "Boussaid", "Boussetta", "Boutaleb", "Bouyaghchi",
      "Chahboun", "Chahine", "Chaoui", "Cherkaoui",
      "Chraibi", "Dahbi", "Dahmani", "Darif",
      "Dkhissi", "Doukkali", "Echkoun", "El Adraoui",
      "El Alaoui", "El Amraoui", "El Amrani", "El Azzouzi",
      "El Bachiri", "El Bakkali", "El Barkani", "El Bouhali",
      "El Fadili", "El Fassi", "El Glaoui", "El Hachimi",
      "El Idrissi", "El Kadiri", "El Khattabi", "El Malki",
      "El Mansouri", "El Ouafi", "El Ouazzani", "El Yamani"
    ].freeze

    # Moroccan cities (all major and medium cities) - EXTENDED LIST
    MOROCCAN_CITIES = [
      "Casablanca", "Rabat", "Marrakech", "Fès", "Meknès", "Agadir", "Tanger",
      "Oujda", "Kenitra", "Tétouan", "Safi", "Mohammedia", "El Jadida",
      "Beni Mellal", "Khouribga", "Settat", "Larache", "Ksar El Kebir",
      "Nador", "Berkane", "Errachidia", "Khemisset", "Ifrane", "Azrou",
      "Chefchaouen", "Al Hoceima", "Taza", "Sidi Kacem", "El Kelaa",
      "Ben Slimane", "Khémisset", "Sidi Bennour", "Youssoufia",
      "Guelmim", "Taroudant", "Tinghir", "Zagora", "Sidi Ifni",
      "Laâyoune", "Dakhla", "Boujdour", "Tan-Tan",
      "Taourirt", "Ouarzazate", "Midelt", "Figuig", "Jerada",
      "Sefrou", "Boulemane", "Taounate", "Guercif", "Imzouren",
      "Fnideq", "Martil", "Saidia", "Ahfir", "Aklim",
      "Tiznit", "Chtouka", "Ait Baha", "Biougra",
      "Tata", "Foum Zguid", "Assa", "Zag",
      "Smara", "Boukraa", "Bir Anzarane",
      "Skhirat", "Temara", "Sale", "Skhirat",
      "Bouskoura", "Mediouna", "Tit Mellil",
      "Aïn Harrouda", "Harhoura", "Moulay Bousselham",
      "Souk El Arbaa", "El Jadida", "Dar Bouazza",
      "El Mansouria", "Bouskoura", "Mediouna",
      "Nouaceur", "Berrechid", "Ben Ahmed",
      "El Gara", "Bouknadel", "Skhirat", "Temara"
    ].freeze

    # Moroccan phone prefixes
    MOROCCAN_PHONE_PREFIXES = %w[06 07].freeze

    class << self
      def name
        "#{first_name} #{last_name}"
      end

      def first_name
        MOROCCAN_FIRST_NAMES.sample
      end

      def last_name
        MOROCCAN_LAST_NAMES.sample
      end

      def email(first_name: nil, last_name: nil)
        first = first_name || self.first_name.downcase
        last = last_name || self.last_name.downcase
        
        # Moroccan domains and common international domains used in Morocco
        domains = %w[
          gmail.com yahoo.fr hotmail.com menara.ma
          inwi.ma iam.ma orange.ma
        ]
        
        "#{first}.#{last}@#{domains.sample}"
      end

      def phone
        prefix = MOROCCAN_PHONE_PREFIXES.sample
        number = rand(10000000..99999999)
        "#{prefix}#{number}"
      end

      def city
        MOROCCAN_CITIES.sample
      end

      def address
        # Authentic Moroccan street names
        streets = %w[
          Av. Hassan II Rue Mohammed V Bd. Zerktouni
          Rue de la Liberté Bd. Mohammed VI
          Rue Allal Ben Abdellah Bd. Abdelkrim Khattabi
          Rue Moulay Ismail Bd. Al Massira Al Khadra
          Rue Ahmed Reda Guedira Bd. Abdelmoumen
          Rue Ibn Sina Bd. Mohammed V
          Rue Moulay Rachid Bd. Hassan I
          Rue Ahmed Chaouki Bd. Zerktouni
        ]
        street = streets.sample
        number = rand(1..500)
        "#{number}, #{street}, #{city}"
      end

      def cni_number
        # Moroccan CNI format: 2 letters + 6 digits (authentic format)
        letters = ('A'..'Z').to_a.sample(2).join
        numbers = rand(100000..999999)
        "#{letters}#{numbers}"
      end

      def bank_account
        # Moroccan bank account format (simplified)
        "MA#{rand(100000000000000000..999999999999999999)}"
      end

      # Additional Moroccan-specific data generators
      
      def postal_code
        # Moroccan postal codes (5 digits)
        rand(10000..99999).to_s
      end

      def company_name
        # Moroccan company name patterns
        prefixes = %w[Groupe Société Entreprise]
        suffixes = %w[Maroc Maghreb Atlas Rif]
        sectors = %w[Commerce Industrie Services Immobilier]
        
        pattern = rand(3)
        case pattern
        when 0
          "#{prefixes.sample} #{suffixes.sample}"
        when 1
          "#{sectors.sample} #{city}"
        else
          "#{last_name} #{sectors.sample}"
        end
      end

      def region
        # Moroccan regions
        regions = [
          "Casablanca-Settat", "Rabat-Salé-Kénitra",
          "Fès-Meknès", "Marrakech-Safi",
          "Tanger-Tétouan-Al Hoceïma",
          "Oriental", "Béni Mellal-Khénifra",
          "Drâa-Tafilalet", "Souss-Massa",
          "Guelmim-Oued Noun", "Laâyoune-Sakia El Hamra",
          "Dakhla-Oued Ed-Dahab"
        ]
        regions.sample
      end

      def university
        # Moroccan universities
        universities = [
          "Université Mohammed V de Rabat", "Université Hassan II de Casablanca",
          "Université Ibn Tofail de Kénitra", "Université Cadi Ayyad de Marrakech",
          "Université Abdelmalek Essaâdi de Tanger", "Université Sidi Mohammed Ben Abdellah de Fès",
          "Université Ibn Zohr d'Agadir", "Université Chouaib Doukkali d'El Jadida",
          "Université Sultan Moulay Slimane de Beni Mellal", "Université Mohammed Premier d'Oujda",
          "Université Hassan Ier de Settat", "École Polytechnique de l'Université Internationale de Rabat"
        ]
        universities.sample
      end

      # Additional rich Moroccan data generators

      def neighborhood
        # Famous Moroccan neighborhoods and districts
        neighborhoods = [
          "Medina", "Gueliz", "Maarif", "Anfa", "Derb Sultan",
          "Hay Hassani", "Sbata", "Lissasfa", "Ain Diab",
          "Racine", "Bourgogne", "Palmier", "Californie",
          "Ouasis", "Sidi Bernoussi", "Mers Sultan",
          "Agdal", "Yacoub El Mansour", "Hassan",
          "Souissi", "La Gironde", "El Oulfa",
          "L'Hivernage", "Marjane", "Touarga",
          "Massira", "Sidi Moumen", "Hay Mohammadi",
          "Ben M'sick", "Sidi Othman", "El Harti",
          "Tabriquet", "Les Princes", "Sidi Maârouf",
          "Diour", "Jamaâ", "Hay El Hanaa",
          "Errahma", "Hay El Farah"
        ]
        neighborhoods.sample
      end

      def medical_specialty
        # Moroccan medical specialties (since it's DabaDoc)
        specialties = [
          "Médecine générale", "Pédiatrie", "Cardiologie",
          "Dermatologie", "Ophtalmologie", "ORL",
          "Gynécologie Obstétrique", "Chirurgie générale",
          "Médecine interne", "Psychiatrie", "Radiologie",
          "Anesthésie-réanimation", "Néphrologie",
          "Hépatologie", "Gastro-entérologie", "Endocrinologie",
          "Rhumatologie", "Neurologie", "Urologie",
          "Traumatologie", "Orthopédie", "Chirurgie plastique",
          "Chirurgie vasculaire", "Médecine du travail",
          "Médecine légale", "Médecine nucléaire",
          "Médecine physique", "Oncologie"
        ]
        specialties.sample
      end

      def profession
        # Common Moroccan professions
        professions = %w[
          Médecin Ingénieur Enseignant
          Avocat Notaire Architecte
          Pharmacien Commerçant Artisan
          Agriculteur Fonctionnaire Journaliste
          Banquier Comptable Informaticien
          Électricien Plombier Menuisier
          Coiffeur Serveur Chauffeur
          Garde-malade Secrétaire Traducteur
          Guide touristique Vendeur
        ]
        professions.sample
      end

      def traditional_dish
        # Famous Moroccan traditional dishes
        dishes = [
          "Couscous", "Tagine", "Pastilla", "Harira",
          "Rfissa", "Tanjia", "Mechoui", "Briouates",
          "Msemen", "Meloui", "Baghrir", "Khobz",
          "Bissara", "Lentilles aux merguez",
          "Khlia", "Merguez", "Sardines grillées",
          "Daqous aux olives", "Kefta aux œufs",
          "Poulet aux citrons confits",
          "Tajine aux pruneaux", "Tajine aux abricots",
          "Chorba frik", "Soupe de poisson",
          "Maâqouda", "Zaalouk"
        ]
        dishes.sample
      end

      def spice
        # Moroccan spices and ingredients
        spices = %w[
          Ras-el-hanout Safran Cannelle
          Curcuma Gingembre Paprika
          Cumin Coriandre Cardamome
          Muscade Poivre noir Piment
          Fenouil Anis étoilé Clous de girofle
          Laurier Citron confit Olives
          Amandes Pistaches Noix
          Miel d'oranger Fleur d'oranger
          Huile d'argan Beurre clarifié
        ]
        spices.sample
      end

      def souk
        # Famous Moroccan markets/souks
        souks = [
          "Souk Semmarine", "Souk El Kébir", "Souk El Attarine",
          "Souk Zitoun El Jdid", "Souk El Hadadine",
          "Souk El Bahia", "Souk Smarine", "Souk El Ghezel",
          "Souk El Koutoubine", "Souk El Abid",
          "Souk Sebbaghine", "Souk Cherratine",
          "Souk Nejjarine", "Marché Central",
          "Souk Al Fassia", "Souk El Joutia"
        ]
        souks.sample
      end

      def bank
        # Moroccan banks
        banks = [
          "Attijariwafa Bank", "Banque Centrale Populaire",
          "BMCI", "Banque Marocaine pour le Commerce et l'Industrie",
          "Société Générale Maroc", "Crédit du Maroc",
          "Banque Marocaine du Commerce Extérieur", "CIH Bank",
          "Crédit Immobilier et Hôtelier", "Al Barid Bank",
          "Bank Al Maghrib", "CFG Bank",
          "Crédit Agricole du Maroc", "Umnia Bank"
        ]
        banks.sample
      end

      def restaurant
        # Moroccan restaurant/café names
        restaurants = [
          "Café Clock", "Nomad", "Le Jardin",
          "Café Bousafsaf", "Dar Moha", "Al Fassia",
          "Café de France", "Le Jardin d'Essai",
          "Café Hafa", "Nomad Café", "Dar Essalam",
          "Café Central", "Le Jardin Secret",
          "Café Arabe", "Dar El Hana"
        ]
        restaurants.sample
      end

      def hotel
        # Moroccan hotels/riads
        hotels = [
          "Riad Kniza", "Palmeraie Palace",
          "Hotel Sahrai", "Riad Al Fassia",
          "Hotel El Andalous", "Riad El Cadi",
          "Hotel Atlas Medina", "Riad Dar Anika",
          "Hotel Nomade", "Riad Zitouna",
          "Hotel Al Fassia", "Riad Les Jardin"
        ]
        hotels.sample
      end

      def mosque
        # Famous Moroccan mosques
        mosques = [
          "Mosquée Hassan II", "Mosquée Koutoubia",
          "Mosquée Al Quaraouiyine", "Mosquée Bahia",
          "Mosquée Saadian", "Mosquée Moulay Idriss",
          "Mosquée El Badi", "Mosquée Lalla Aouda",
          "Mosquée Tin Mal", "Mosquée Nejjarine",
          "Mosquée Cherratine", "Mosquée El Glaoui"
        ]
        mosques.sample
      end

      def school
        # Moroccan schools and educational institutions
        schools = [
          "Lycée Descartes", "Lycée Lyautey",
          "Lycée Moulay Youssef", "Lycée Mohammed V",
          "École Américaine", "Lycée Français",
          "École Mission La Sallle", "Lycée Victor Hugo",
          "École Sainte Marie", "Lycée Ibn Khaldoun",
          "École Al Khansaa", "Lycée Ibn Sina"
        ]
        schools.sample
      end

      def newspaper
        # Moroccan newspapers and media
        newspapers = [
          "Le Matin", "L'Économiste",
          "Libération", "Aujourd'hui le Maroc",
          "Al Alam", "Assabah",
          "Bayane Al Yaoum", "Al Akhbar",
          "Al Massae", "Al Ahdath Al Maghribia",
          "Al Ittihad Al Ichtiraki", "Rissalat Al Oumma"
        ]
        newspapers.sample
      end

      def festival
        # Moroccan festivals and cultural events
        festivals = [
          "Festival de Marrakech", "Festival de Fès",
          "Festival de Tan-Tan", "Festival de Rabat",
          "Festival Mawazine", "Festival Jazzablanca",
          "Festival de Taroudant", "Festival de Meknès",
          "Festival de Ouarzazate", "Festival de Tanger",
          "Festival de Chefchaouen", "Festival de Asilah"
        ]
        festivals.sample
      end
    end
  end
end
