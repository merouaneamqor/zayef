# frozen_string_literal: true

require_relative "lib/zayef/version"

Gem::Specification.new do |spec|
  spec.name = "zayef"
  spec.version = Zayef::VERSION
  spec.authors = ["Merouane AMQOR"]
  spec.email = ["marouane.amqor@gmail.com"]

  spec.summary = "🇲🇦 Zayef - Authentic Moroccan Data Generator for Ruby"
  spec.description = "Zayef (زايف) is the first Ruby gem dedicated to generating authentic Moroccan data. Perfect for testing, development, and localization with 300+ real Moroccan names, cities, companies, and cultural elements. From traditional dishes to medical specialties - everything Moroccan! 🔥"
  spec.homepage = "https://github.com/merouaneamqor/zayef"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/merouaneamqor/zayef"
  spec.metadata["changelog_uri"] = "https://github.com/merouaneamqor/zayef/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
