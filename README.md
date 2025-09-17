# Zayef 🔥

A Ruby gem for generating fake data with a Moroccan touch. Perfect for testing and development!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zayef'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install zayef

## Usage

```ruby
require 'zayef'

# Generate a full name
Zayef.name                    # => "Youssef Alaoui"

# Generate individual components
Zayef.first_name              # => "Fatima"
Zayef.last_name               # => "Bennani"

# Generate email
Zayef.email                   # => "ayoub.kabbaj@gmail.com"
Zayef.email(first_name: "Ahmed", last_name: "El Fassi")  # => "ahmed.el_fassi@yahoo.fr"

# Generate phone number (Moroccan format)
Zayef.phone                   # => "0612345678"

# Generate address
Zayef.city                    # => "Casablanca"
Zayef.address                 # => "123, Av. Hassan II, Rabat"

# Generate Moroccan-specific data
Zayef.cni_number             # => "AB123456"
Zayef.bank_account           # => "MA123456789012345678"
Zayef.postal_code            # => "20000"
Zayef.company_name           # => "Groupe Maroc"
Zayef.region                 # => "Casablanca-Settat"
Zayef.university             # => "Université Mohammed V de Rabat"
Zayef.neighborhood           # => "Medina"
Zayef.medical_specialty      # => "Médecine générale"
Zayef.profession             # => "Médecin"
Zayef.traditional_dish       # => "Couscous"
Zayef.spice                  # => "Ras-el-hanout"
Zayef.souk                   # => "Souk Semmarine"
Zayef.bank                   # => "Attijariwafa Bank"
Zayef.restaurant             # => "Café Clock"
Zayef.hotel                  # => "Riad Kniza"
Zayef.mosque                 # => "Mosquée Hassan II"
Zayef.school                 # => "Lycée Descartes"
Zayef.newspaper              # => "Le Matin"
Zayef.festival               # => "Festival de Marrakech"
```

## Features

### 🎯 **Personal Information**
- 🏠 **Moroccan Names**: 40+ authentic first names + 50+ family names
- 📧 **Email Generation**: Realistic emails with Moroccan domains (menara.ma, iam.ma, orange.ma)
- 📱 **Phone Numbers**: Moroccan mobile format (06/07 prefixes)
- 🏙️ **Cities & Addresses**: 50+ real Moroccan cities + authentic street names
- 🏡 **Neighborhoods**: Famous districts (Medina, Gueliz, Maarif, etc.)
- 🆔 **CNI Numbers**: Moroccan ID format (2 letters + 6 digits)
- 🏦 **Bank Accounts**: Moroccan format with MA prefix
- 📮 **Postal Codes**: 5-digit Moroccan postal codes

### 🏢 **Professional & Business**
- 👨‍⚕️ **Medical Specialties**: 25+ Moroccan medical specialties (DabaDoc integration)
- 👔 **Professions**: Common Moroccan professions (médecin, ingénieur, etc.)
- 🏢 **Company Names**: Authentic Moroccan business naming patterns
- 🏦 **Banks**: All major Moroccan banks (Attijariwafa, BCP, BMCI, etc.)
- 📰 **Newspapers**: Moroccan media outlets (Le Matin, L'Économiste, etc.)

### 🎓 **Education & Culture**
- 🗺️ **Regions**: All 12 Moroccan administrative regions
- 🎓 **Universities**: 12+ major Moroccan universities with full names
- 🏫 **Schools**: Famous Moroccan schools and lycées
- 🎭 **Festivals**: Major Moroccan cultural festivals
- 🕌 **Mosques**: Famous Moroccan mosques (Hassan II, Koutoubia, etc.)

### 🍽️ **Culture & Lifestyle**
- 🍲 **Traditional Dishes**: Famous Moroccan cuisine (couscous, tagine, pastilla, etc.)
- 🌶️ **Spices**: Moroccan spices and ingredients (ras-el-hanout, safran, etc.)
- 🏪 **Souks**: Traditional Moroccan markets (Souk Semmarine, Bahia, etc.)
- ☕ **Cafés/Restaurants**: Famous Moroccan cafés and restaurants
- 🏨 **Hotels/Riads**: Moroccan hotels and traditional riads

### 📊 **Statistics**
- **Total Data Points**: 300+ authentic Moroccan entries
- **Categories**: 18 different data types
- **100% Moroccan**: Everything is authentically Moroccan
- **No Duplicates**: All data is unique and varied

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amqor/zayef.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).