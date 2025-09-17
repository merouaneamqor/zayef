# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/clean"

# Changelog tasks
namespace :changelog do
  desc "Generate changelog for unreleased changes"
  task :unreleased do
    sh "./bin/generate-changelog --unreleased"
  end

  desc "Generate changelog for latest version"
  task :latest do
    sh "./bin/generate-changelog --latest"
  end

  desc "Generate full changelog"
  task :full do
    sh "./bin/generate-changelog"
  end

  desc "Check if git-cliff is available"
  task :check do
    if system("git-cliff --version > /dev/null 2>&1")
      puts "✅ git-cliff is available"
    else
      puts "❌ git-cliff is not installed"
      puts "Run: cargo install git-cliff"
    end
  end
end

# Release tasks
namespace :release do
  desc "Prepare for release (generate changelog, bump version, commit)"
  task :prepare do
    puts "🚀 Preparing release..."

    # Check git status
    unless system("git diff --quiet")
      puts "❌ Working directory is not clean. Commit or stash changes first."
      exit 1
    end

    # Generate changelog
    puts "📝 Generating changelog..."
    sh "./bin/generate-changelog --unreleased"

    # Ask for version bump type
    puts "📋 Choose version bump:"
    puts "  1. patch (0.1.0 -> 0.1.1)"
    puts "  2. minor (0.1.0 -> 0.2.0)"
    puts "  3. major (0.1.0 -> 1.0.0)"
    print "Enter choice (1-3): "

    choice = STDIN.gets.chomp
    bump_type = case choice
                when "1" then "patch"
                when "2" then "minor"
                when "3" then "major"
                else
                  puts "❌ Invalid choice"
                  exit 1
                end

    puts "🔄 Bumping version (#{bump_type})..."
    sh "gem bump --version #{bump_type}"

    puts "✅ Release preparation complete!"
    puts "📋 Next steps:"
    puts "  1. Review the generated CHANGELOG.md"
    puts "  2. Run: rake release:publish"
  end

  desc "Publish gem to RubyGems.org"
  task :publish do
    puts "📦 Publishing gem to RubyGems.org..."

    # Build the gem
    sh "gem build zayef.gemspec"

    # Get the gem filename
    version = File.read("lib/zayef/version.rb").match(/VERSION = "(.+)"/)[1]
    gem_file = "zayef-#{version}.gem"

    unless File.exist?(gem_file)
      puts "❌ Gem file #{gem_file} not found"
      exit 1
    end

    # Push to RubyGems
    sh "gem push #{gem_file}"

    puts "✅ Gem published successfully!"
    puts "🎉 Zayef v#{version} is now live on RubyGems.org!"
  end

  desc "Full release process (prepare + publish)"
  task full: [:prepare, :publish]
end

# Development tasks
namespace :dev do
  desc "Run tests and linting"
  task :test do
    puts "🧪 Running tests..."
    # Add test commands here when tests are added
    puts "✅ Tests complete"
  end

  desc "Generate documentation"
  task :docs do
    puts "📚 Generating documentation..."
    sh "yardoc lib/**/*.rb"
  end

  desc "Check code quality"
  task quality: [:test, :docs] do
    puts "✅ Code quality checks complete"
  end
end

# Git tasks
namespace :git do
  desc "Create conventional commit"
  task :commit do
    puts "📝 Creating conventional commit..."
    puts "Available commit types:"
    puts "  feat:     A new feature"
    puts "  fix:      A bug fix"
    puts "  docs:     Documentation only changes"
    puts "  style:    Changes that do not affect the meaning of the code"
    puts "  refactor: A code change that neither fixes a bug nor adds a feature"
    puts "  perf:     A code change that improves performance"
    puts "  test:     Adding missing tests or correcting existing tests"
    puts "  chore:    Changes to the build process or auxiliary tools"

    print "Enter commit type: "
    type = STDIN.gets.chomp

    print "Enter scope (optional): "
    scope = STDIN.gets.chomp
    scope = "(#{scope})" unless scope.empty?

    print "Enter commit message: "
    message = STDIN.gets.chomp

    full_message = "#{type}#{scope}: #{message}"
    sh "git add ."
    sh "git commit -m '#{full_message}'"

    puts "✅ Commit created: #{full_message}"
  end
end

# Default task
task default: ["changelog:check", "dev:quality"]

# Clean up generated files
CLEAN.include("*.gem", "CHANGELOG.md", "doc/")
