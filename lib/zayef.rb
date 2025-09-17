# frozen_string_literal: true

require_relative "zayef/version"
require_relative "zayef/generator"

module Zayef
  class Error < StandardError; end
  
  # Quick access to generator methods
  def self.name
    Generator.name
  end

  def self.first_name
    Generator.first_name
  end

  def self.last_name
    Generator.last_name
  end

  def self.email(**kwargs)
    Generator.email(**kwargs)
  end

  def self.phone
    Generator.phone
  end

  def self.city
    Generator.city
  end

  def self.address
    Generator.address
  end

  def self.cni_number
    Generator.cni_number
  end

  def self.bank_account
    Generator.bank_account
  end

  def self.postal_code
    Generator.postal_code
  end

  def self.company_name
    Generator.company_name
  end

  def self.region
    Generator.region
  end

  def self.university
    Generator.university
  end

  def self.neighborhood
    Generator.neighborhood
  end

  def self.medical_specialty
    Generator.medical_specialty
  end

  def self.profession
    Generator.profession
  end

  def self.traditional_dish
    Generator.traditional_dish
  end

  def self.spice
    Generator.spice
  end

  def self.souk
    Generator.souk
  end

  def self.bank
    Generator.bank
  end

  def self.restaurant
    Generator.restaurant
  end

  def self.hotel
    Generator.hotel
  end

  def self.mosque
    Generator.mosque
  end

  def self.school
    Generator.school
  end

  def self.newspaper
    Generator.newspaper
  end

  def self.festival
    Generator.festival
  end
end
