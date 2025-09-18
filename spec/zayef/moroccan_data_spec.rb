# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Zayef::Generator do
  describe '.region' do
    it 'returns a valid Moroccan administrative region' do
      region = described_class.region
      expect(region).to be_a(String)
      expect(region.length).to be >= 5
    end

    it 'returns different regions on multiple calls' do
      regions = Array.new(10) { described_class.region }
      expect(regions.uniq.length).to be >= 2
    end

    it 'returns only valid Moroccan regions' do
      valid_regions = [
        "Casablanca-Settat", "Rabat-Salé-Kénitra", "Fès-Meknès",
        "Marrakech-Safi", "Tanger-Tétouan-Al Hoceïma", "Oriental",
        "Béni Mellal-Khénifra", "Drâa-Tafilalet", "Souss-Massa",
        "Guelmim-Oued Noun", "Laâyoune-Sakia El Hamra", "Dakhla-Oued Ed-Dahab"
      ]

      region = described_class.region
      expect(valid_regions).to include(region)
    end
  end

  describe '.university' do
    it 'returns a valid Moroccan university name' do
      university = described_class.university
      expect(university).to be_a(String)
      expect(university).to include('Université').or include('École')
    end

    it 'returns different universities on multiple calls' do
      universities = Array.new(10) { described_class.university }
      expect(universities.uniq.length).to be >= 2
    end
  end

  describe '.neighborhood' do
    it 'returns a Moroccan neighborhood or district name' do
      neighborhood = described_class.neighborhood
      expect(neighborhood).to be_a(String)
      expect(neighborhood.length).to be >= 3
    end

    it 'returns different neighborhoods on multiple calls' do
      neighborhoods = Array.new(10) { described_class.neighborhood }
      expect(neighborhoods.uniq.length).to be >= 2
    end
  end

  describe '.medical_specialty' do
    it 'returns a valid Moroccan medical specialty' do
      specialty = described_class.medical_specialty
      expect(specialty).to be_a(String)
      expect(specialty.length).to be >= 5
    end

    it 'returns different specialties on multiple calls' do
      specialties = Array.new(10) { described_class.medical_specialty }
      expect(specialties.uniq.length).to be >= 2
    end

    it 'returns valid medical specialties' do
      valid_specialties = [
        "Médecine générale", "Pédiatrie", "Cardiologie", "Dermatologie",
        "Ophtalmologie", "ORL", "Gynécologie Obstétrique", "Chirurgie générale",
        "Médecine interne", "Psychiatrie", "Radiologie", "Anesthésie-réanimation",
        "Néphrologie", "Hépatologie", "Gastro-entérologie", "Endocrinologie",
        "Rhumatologie", "Neurologie", "Urologie", "Traumatologie",
        "Orthopédie", "Chirurgie plastique", "Chirurgie vasculaire",
        "Médecine du travail", "Médecine légale", "Médecine nucléaire",
        "Médecine physique", "Oncologie"
      ]

      specialty = described_class.medical_specialty
      expect(valid_specialties).to include(specialty)
    end
  end

  describe '.profession' do
    it 'returns a valid Moroccan profession' do
      profession = described_class.profession
      expect(profession).to be_a(String)
      expect(profession.length).to be >= 3
    end

    it 'returns different professions on multiple calls' do
      professions = Array.new(10) { described_class.profession }
      expect(professions.uniq.length).to be >= 2
    end
  end

  describe '.traditional_dish' do
    it 'returns a traditional Moroccan dish' do
      dish = described_class.traditional_dish
      expect(dish).to be_a(String)
      expect(dish.length).to be >= 3
    end

    it 'returns different dishes on multiple calls' do
      dishes = Array.new(10) { described_class.traditional_dish }
      expect(dishes.uniq.length).to be >= 2
    end

    it 'returns authentic Moroccan dishes' do
      valid_dishes = [
        "Couscous", "Tagine", "Pastilla", "Harira", "Rfissa",
        "Tanjia", "Mechoui", "Briouates", "Msemen", "Meloui",
        "Baghrir", "Khobz", "Bissara", "Lentilles aux merguez",
        "Khlia", "Merguez", "Sardines grillées", "Daqous aux olives",
        "Kefta aux œufs", "Poulet aux citrons confits",
        "Tajine aux pruneaux", "Tajine aux abricots", "Chorba frik",
        "Soupe de poisson", "Maâqouda", "Zaalouk"
      ]

      dish = described_class.traditional_dish
      expect(valid_dishes).to include(dish)
    end
  end

  describe '.spice' do
    it 'returns a Moroccan spice or ingredient' do
      spice = described_class.spice
      expect(spice).to be_a(String)
      expect(spice.length).to be >= 3
    end

    it 'returns different spices on multiple calls' do
      spices = Array.new(10) { described_class.spice }
      expect(spices.uniq.length).to be >= 2
    end
  end

  describe '.souk' do
    it 'returns a traditional Moroccan market' do
      souk = described_class.souk
      expect(souk).to be_a(String)
      expect(souk).to include('Souk').or include('Marché')
    end

    it 'returns different souks on multiple calls' do
      souks = Array.new(10) { described_class.souk }
      expect(souks.uniq.length).to be >= 2
    end
  end

  describe '.bank' do
    it 'returns a Moroccan bank name' do
      bank = described_class.bank
      expect(bank).to be_a(String)
      expect(bank.length).to be >= 4
    end

    it 'returns different banks on multiple calls' do
      banks = Array.new(10) { described_class.bank }
      expect(banks.uniq.length).to be >= 2
    end

    it 'returns valid Moroccan banks' do
      valid_banks = [
        "Attijariwafa Bank", "Banque Centrale Populaire", "BMCI",
        "Banque Marocaine pour le Commerce et l'Industrie",
        "Société Générale Maroc", "Crédit du Maroc",
        "Banque Marocaine du Commerce Extérieur", "CIH Bank",
        "Crédit Immobilier et Hôtelier", "Al Barid Bank",
        "Bank Al Maghrib", "CFG Bank", "Crédit Agricole du Maroc", "Umnia Bank"
      ]

      bank = described_class.bank
      expect(valid_banks).to include(bank)
    end
  end

  describe '.restaurant' do
    it 'returns a Moroccan restaurant or café name' do
      restaurant = described_class.restaurant
      expect(restaurant).to be_a(String)
      expect(restaurant.length).to be >= 3
    end

    it 'returns different restaurants on multiple calls' do
      restaurants = Array.new(10) { described_class.restaurant }
      expect(restaurants.uniq.length).to be >= 2
    end
  end

  describe '.hotel' do
    it 'returns a Moroccan hotel or riad name' do
      hotel = described_class.hotel
      expect(hotel).to be_a(String)
      expect(hotel.length).to be >= 5
    end

    it 'returns different hotels on multiple calls' do
      hotels = Array.new(10) { described_class.hotel }
      expect(hotels.uniq.length).to be >= 2
    end
  end

  describe '.mosque' do
    it 'returns a famous Moroccan mosque' do
      mosque = described_class.mosque
      expect(mosque).to be_a(String)
      expect(mosque).to include('Mosquée')
    end

    it 'returns different mosques on multiple calls' do
      mosques = Array.new(10) { described_class.mosque }
      expect(mosques.uniq.length).to be >= 2
    end
  end

  describe '.school' do
    it 'returns a Moroccan school name' do
      school = described_class.school
      expect(school).to be_a(String)
      expect(school).to include('Lycée').or include('École')
    end

    it 'returns different schools on multiple calls' do
      schools = Array.new(10) { described_class.school }
      expect(schools.uniq.length).to be >= 2
    end
  end

  describe '.newspaper' do
    it 'returns a Moroccan newspaper name' do
      newspaper = described_class.newspaper
      expect(newspaper).to be_a(String)
      expect(newspaper.length).to be >= 3
    end

    it 'returns different newspapers on multiple calls' do
      newspapers = Array.new(10) { described_class.newspaper }
      expect(newspapers.uniq.length).to be >= 2
    end
  end

  describe '.festival' do
    it 'returns a Moroccan festival name' do
      festival = described_class.festival
      expect(festival).to be_a(String)
      expect(festival).to include('Festival')
    end

    it 'returns different festivals on multiple calls' do
      festivals = Array.new(10) { described_class.festival }
      expect(festivals.uniq.length).to be >= 2
    end
  end
end
