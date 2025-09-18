# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Zayef::Generator do
  describe '.name' do
    it 'returns a full name with first and last name' do
      name = described_class.name
      expect(name).to be_a(String)
      expect(name.split.length).to be >= 2
    end

    it 'returns different names on multiple calls' do
      names = Array.new(10) { described_class.name }
      expect(names.uniq.length).to be >= 2
    end
  end

  describe '.first_name' do
    it 'returns a Moroccan first name' do
      first_name = described_class.first_name
      expect(first_name).to be_a(String)
      expect(first_name.length).to be >= 3
      expect(described_class::MOROCCAN_FIRST_NAMES).to include(first_name)
    end

    it 'returns different names on multiple calls' do
      first_names = Array.new(10) { described_class.first_name }
      expect(first_names.uniq.length).to be >= 2
    end
  end

  describe '.last_name' do
    it 'returns a Moroccan last name' do
      last_name = described_class.last_name
      expect(last_name).to be_a(String)
      expect(last_name.length).to be >= 3
      expect(described_class::MOROCCAN_LAST_NAMES).to include(last_name)
    end

    it 'returns different names on multiple calls' do
      last_names = Array.new(10) { described_class.last_name }
      expect(last_names.uniq.length).to be >= 2
    end
  end

  describe '.email' do
    it 'returns a valid email address' do
      email = described_class.email
      expect(email).to be_a_valid_email
      expect(email).to include('@')
    end

    it 'returns different emails on multiple calls' do
      emails = Array.new(10) { described_class.email }
      expect(emails.uniq.length).to be >= 2
    end

    it 'includes Moroccan domains' do
      email = described_class.email
      moroccan_domains = %w[gmail.com yahoo.fr hotmail.com menara.ma inwi.ma iam.ma orange.ma]
      domain = email.split('@').last
      expect(moroccan_domains).to include(domain)
    end

    context 'with custom first_name and last_name' do
      it 'uses the provided names' do
        custom_first = 'Ahmed'
        custom_last = 'Test'
        email = described_class.email(first_name: custom_first, last_name: custom_last)
        expect(email).to include(custom_first)
        expect(email).to include(custom_last)
      end
    end
  end

  describe '.phone' do
    it 'returns a valid Moroccan phone number' do
      phone = described_class.phone
      expect(phone).to be_a_moroccan_phone_number
      expect(phone).to start_with('06').or start_with('07')
      expect(phone.length).to eq(10)
    end

    it 'returns different phone numbers on multiple calls' do
      phones = Array.new(10) { described_class.phone }
      expect(phones.uniq.length).to be >= 2
    end
  end

  describe '.city' do
    it 'returns a Moroccan city' do
      city = described_class.city
      expect(city).to be_a(String)
      expect(described_class::MOROCCAN_CITIES).to include(city)
    end

    it 'returns different cities on multiple calls' do
      cities = Array.new(10) { described_class.city }
      expect(cities.uniq.length).to be >= 2
    end
  end

  describe '.address' do
    it 'returns a complete address' do
      address = described_class.address
      expect(address).to be_a(String)
      expect(address).to include(',')
      expect(address.split(',').length).to be >= 2
    end

    it 'includes a valid Moroccan city' do
      address = described_class.address
      city = described_class::MOROCCAN_CITIES.find { |c| address.include?(c) }
      expect(city).to be_truthy
    end

    it 'returns different addresses on multiple calls' do
      addresses = Array.new(10) { described_class.address }
      expect(addresses.uniq.length).to be >= 2
    end
  end

  describe '.cni_number' do
    it 'returns a valid Moroccan CNI number format' do
      cni = described_class.cni_number
      expect(cni).to be_a_valid_cni_number
      expect(cni.length).to eq(8)
      expect(cni).to match(/\A[A-Z]{2}\d{6}\z/)
    end

    it 'returns different CNI numbers on multiple calls' do
      cnis = Array.new(10) { described_class.cni_number }
      expect(cnis.uniq.length).to be >= 2
    end
  end

  describe '.bank_account' do
    it 'returns a valid Moroccan bank account number' do
      account = described_class.bank_account
      expect(account).to be_a_valid_bank_account
      expect(account).to start_with('MA')
      expect(account.length).to eq(20)
    end

    it 'returns different account numbers on multiple calls' do
      accounts = Array.new(10) { described_class.bank_account }
      expect(accounts.uniq.length).to be >= 2
    end
  end

  describe '.postal_code' do
    it 'returns a valid 5-digit postal code' do
      postal_code = described_class.postal_code
      expect(postal_code).to be_a_valid_postal_code
      expect(postal_code.length).to eq(5)
      expect(postal_code).to match(/\A\d{5}\z/)
    end

    it 'returns different postal codes on multiple calls' do
      postal_codes = Array.new(10) { described_class.postal_code }
      expect(postal_codes.uniq.length).to be >= 2
    end
  end

  describe '.company_name' do
    it 'returns a Moroccan company name' do
      company = described_class.company_name
      expect(company).to be_a(String)
      expect(company.length).to be >= 5
    end

    it 'returns different company names on multiple calls' do
      companies = Array.new(10) { described_class.company_name }
      expect(companies.uniq.length).to be >= 2
    end
  end
end
