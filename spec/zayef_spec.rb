# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Zayef do
  describe 'module interface' do
    it 'has access to all generator methods' do
      expect(described_class).to respond_to(:name)
      expect(described_class).to respond_to(:first_name)
      expect(described_class).to respond_to(:last_name)
      expect(described_class).to respond_to(:email)
      expect(described_class).to respond_to(:phone)
      expect(described_class).to respond_to(:city)
      expect(described_class).to respond_to(:address)
      expect(described_class).to respond_to(:cni_number)
      expect(described_class).to respond_to(:bank_account)
      expect(described_class).to respond_to(:postal_code)
      expect(described_class).to respond_to(:company_name)
      expect(described_class).to respond_to(:region)
      expect(described_class).to respond_to(:university)
      expect(described_class).to respond_to(:neighborhood)
      expect(described_class).to respond_to(:medical_specialty)
      expect(described_class).to respond_to(:profession)
      expect(described_class).to respond_to(:traditional_dish)
      expect(described_class).to respond_to(:spice)
      expect(described_class).to respond_to(:souk)
      expect(described_class).to respond_to(:bank)
      expect(described_class).to respond_to(:restaurant)
      expect(described_class).to respond_to(:hotel)
      expect(described_class).to respond_to(:mosque)
      expect(described_class).to respond_to(:school)
      expect(described_class).to respond_to(:newspaper)
      expect(described_class).to respond_to(:festival)
    end
  end

  describe 'data generation' do
    it 'generates a complete Moroccan person profile' do
      profile = {
        name: described_class.name,
        first_name: described_class.first_name,
        last_name: described_class.last_name,
        email: described_class.email,
        phone: described_class.phone,
        city: described_class.city,
        address: described_class.address,
        cni_number: described_class.cni_number,
        bank_account: described_class.bank_account,
        postal_code: described_class.postal_code
      }

      expect(profile[:name]).to be_a(String)
      expect(profile[:email]).to be_a_valid_email
      expect(profile[:phone]).to be_a_moroccan_phone_number
      expect(profile[:cni_number]).to be_a_valid_cni_number
      expect(profile[:bank_account]).to be_a_valid_bank_account
      expect(profile[:postal_code]).to be_a_valid_postal_code
    end

    it 'generates Moroccan cultural data' do
      cultural_data = {
        region: described_class.region,
        university: described_class.university,
        neighborhood: described_class.neighborhood,
        medical_specialty: described_class.medical_specialty,
        profession: described_class.profession,
        traditional_dish: described_class.traditional_dish,
        spice: described_class.spice,
        souk: described_class.souk,
        bank: described_class.bank,
        restaurant: described_class.restaurant,
        hotel: described_class.hotel,
        mosque: described_class.mosque,
        school: described_class.school,
        newspaper: described_class.newspaper,
        festival: described_class.festival
      }

      # All values should be non-empty strings
      cultural_data.each do |key, value|
        expect(value).to be_a(String)
        expect(value.length).to be >= 3
      end
    end

    it 'generates consistent data across multiple calls' do
      # Test that we can generate multiple complete profiles
      profiles = []
      5.times do
        profiles << {
          name: described_class.name,
          email: described_class.email,
          phone: described_class.phone,
          city: described_class.city,
          region: described_class.region
        }
      end

      # Should have 5 different profiles
      expect(profiles.length).to eq(5)

      # Each profile should be valid
      profiles.each do |profile|
        expect(profile[:name]).to be_a(String)
        expect(profile[:email]).to be_a_valid_email
        expect(profile[:phone]).to be_a_moroccan_phone_number
        expect(profile[:city]).to be_a(String)
        expect(profile[:region]).to be_a(String)
      end
    end

    it 'generates data suitable for DabaDoc medical system' do
      # Test data specifically relevant for DabaDoc (medical system)
      medical_profile = {
        doctor_name: described_class.name,
        specialty: described_class.medical_specialty,
        clinic_address: described_class.address,
        phone: described_class.phone,
        email: described_class.email,
        city: described_class.city,
        region: described_class.region
      }

      # Validate medical-specific data
      expect(medical_profile[:doctor_name]).to be_a(String)
      expect(medical_profile[:specialty]).to be_a(String)
      expect(medical_profile[:specialty].length).to be >= 5
      expect(medical_profile[:clinic_address]).to be_a(String)
      expect(medical_profile[:phone]).to be_a_moroccan_phone_number
      expect(medical_profile[:email]).to be_a_valid_email
      expect(medical_profile[:city]).to be_a(String)
      expect(medical_profile[:region]).to be_a(String)
    end
  end

  describe 'email generation with custom parameters' do
    it 'accepts custom first_name and last_name for email generation' do
      custom_first = 'Ahmed'
      custom_last = 'Alaoui'
      email = described_class.email(first_name: custom_first, last_name: custom_last)

      expect(email).to be_a_valid_email
      expect(email).to include(custom_first)
      expect(email).to include(custom_last)
    end

    it 'generates email using existing name components' do
      first_name = described_class.first_name
      last_name = described_class.last_name
      email = described_class.email(first_name: first_name, last_name: last_name)

      expect(email).to be_a_valid_email
      expect(email).to include(first_name)
      expect(email).to include(last_name)
    end
  end

  describe 'data quality and authenticity' do
    it 'generates authentic Moroccan data' do
      # Test that generated data reflects Moroccan reality
      phone = described_class.phone
      city = described_class.city
      region = described_class.region

      # Moroccan phone numbers start with 06 or 07
      expect(phone).to start_with('06').or start_with('07')

      # Cities should be real Moroccan cities
      expect(Zayef::Generator::MOROCCAN_CITIES).to include(city)

      # Regions should be official Moroccan administrative regions
      valid_regions = [
        "Casablanca-Settat", "Rabat-Salé-Kénitra", "Fès-Meknès",
        "Marrakech-Safi", "Tanger-Tétouan-Al Hoceïma", "Oriental",
        "Béni Mellal-Khénifra", "Drâa-Tafilalet", "Souss-Massa",
        "Guelmim-Oued Noun", "Laâyoune-Sakia El Hamra", "Dakhla-Oued Ed-Dahab"
      ]
      expect(valid_regions).to include(region)
    end

    it 'provides good coverage of Moroccan data' do
      # Test that we get variety in generated data
      names = Array.new(20) { described_class.name }
      cities = Array.new(20) { described_class.city }
      specialties = Array.new(20) { described_class.medical_specialty }

      # Should have good variety (at least 60% unique values)
      expect(names.uniq.length).to be >= 12
      expect(cities.uniq.length).to be >= 12
      expect(specialties.uniq.length).to be >= 12
    end
  end

  describe 'error handling' do
    it 'handles edge cases gracefully' do
      # All methods should return valid data without raising exceptions
      expect { described_class.name }.not_to raise_error
      expect { described_class.email }.not_to raise_error
      expect { described_class.phone }.not_to raise_error
      expect { described_class.city }.not_to raise_error
      expect { described_class.address }.not_to raise_error
      expect { described_class.cni_number }.not_to raise_error
      expect { described_class.bank_account }.not_to raise_error
      expect { described_class.postal_code }.not_to raise_error
      expect { described_class.company_name }.not_to raise_error
      expect { described_class.region }.not_to raise_error
      expect { described_class.university }.not_to raise_error
      expect { described_class.neighborhood }.not_to raise_error
      expect { described_class.medical_specialty }.not_to raise_error
      expect { described_class.profession }.not_to raise_error
      expect { described_class.traditional_dish }.not_to raise_error
      expect { described_class.spice }.not_to raise_error
      expect { described_class.souk }.not_to raise_error
      expect { described_class.bank }.not_to raise_error
      expect { described_class.restaurant }.not_to raise_error
      expect { described_class.hotel }.not_to raise_error
      expect { described_class.mosque }.not_to raise_error
      expect { described_class.school }.not_to raise_error
      expect { described_class.newspaper }.not_to raise_error
      expect { described_class.festival }.not_to raise_error
    end
  end
end
