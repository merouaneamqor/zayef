# Contributing to Zayef 🔥

Thank you for your interest in contributing to Zayef! This document provides guidelines and information for contributors.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Development Workflow](#development-workflow)
- [Testing](#testing)
- [Code Style](#code-style)
- [Submitting Changes](#submitting-changes)
- [Reporting Issues](#reporting-issues)
- [Documentation](#documentation)

## Code of Conduct

This project follows a code of conduct to ensure a welcoming environment for all contributors. By participating, you agree to:

- Be respectful and inclusive
- Focus on constructive feedback
- Accept responsibility for mistakes
- Show empathy towards other contributors
- Help create a positive community

## Getting Started

### Prerequisites

- Ruby 2.7+ (check version with `ruby -v`)
- Bundler (`gem install bundler`)
- Git

### Quick Setup

1. Fork the repository on GitHub
2. Clone your fork:
   ```bash
   git clone https://github.com/your-username/zayef.git
   cd zayef
   ```
3. Set up the development environment:
   ```bash
   bin/setup
   ```
4. Verify everything works:
   ```bash
   bundle exec ruby demo.rb
   ```

## Development Setup

### Installing Dependencies

```bash
bundle install
```

### Available Development Tasks

Zayef uses Rake for development tasks. Run `rake -T` to see all available tasks:

```bash
# Run all quality checks (tests, docs, etc.)
rake

# Run tests
rake dev:test

# Generate documentation
rake dev:docs

# Check code quality
rake dev:quality

# Generate changelog
rake changelog:full

# Check if git-cliff is available
rake changelog:check

# Create conventional commit interactively
rake git:commit
```

## Development Workflow

### 1. Choose an Issue

- Check existing [issues](https://github.com/amqor/zayef/issues) on GitHub
- Look for issues labeled `good first issue` or `help wanted`
- Comment on the issue to indicate you're working on it

### 2. Create a Feature Branch

```bash
# Create and switch to a new branch
git checkout -b feature/your-feature-name

# Or for bug fixes
git checkout -b fix/issue-number-description
```

### 3. Make Your Changes

- Write tests first (TDD approach)
- Follow the existing code style
- Add documentation for new features
- Ensure all tests pass

### 4. Test Your Changes

```bash
# Run the full test suite
rake dev:test

# Run specific tests
bundle exec rspec spec/path/to/test.rb

# Run the demo to verify functionality
bundle exec ruby demo.rb
```

## Testing

### Running Tests

```bash
# Run all tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/zayef/generator_spec.rb

# Run with coverage
bundle exec rspec --coverage
```

### Writing Tests

- Place test files in `spec/` directory
- Use descriptive test names
- Test both positive and negative scenarios
- Include edge cases

Example test structure:
```ruby
RSpec.describe Zayef::Generator do
  describe '#first_name' do
    it 'returns a Moroccan first name' do
      name = Zayef.first_name
      expect(Zayef::Generator::MOROCCAN_FIRST_NAMES).to include(name)
    end
  end
end
```

## Code Style

### Ruby Style Guidelines

- Follow the [Ruby Style Guide](https://rubystyle.guide/)
- Use 2 spaces for indentation (no tabs)
- Keep lines under 80 characters when possible
- Use meaningful variable and method names
- Add comments for complex logic

### Commit Messages

This project uses [Conventional Commits](https://conventionalcommits.org/):

```bash
# Features
git commit -m "feat: add support for traditional Moroccan dishes"

# Bug fixes
git commit -m "fix: correct CNI number format validation"

# Documentation
git commit -m "docs: update README with new usage examples"

# Breaking changes
git commit -m "feat!: change API interface (breaking change)"

# With scope
git commit -m "feat(generator): add support for new data categories"
```

### Code Organization

- Keep methods small and focused
- Use private methods for internal logic
- Group related functionality in modules/classes
- Add YARD documentation comments

## Submitting Changes

### Pull Request Process

1. **Update Documentation**: Update README.md and any relevant documentation
2. **Update Changelog**: Add an entry to CHANGELOG.md (use `rake changelog:unreleased`)
3. **Test Thoroughly**: Ensure all tests pass and add new tests for your changes
4. **Update Version**: If making breaking changes, update version in `lib/zayef/version.rb`

### Pull Request Template

When submitting a PR, include:

- **Description**: What changes were made and why
- **Type of Change**: Bug fix, feature, documentation, etc.
- **Breaking Changes**: Any breaking changes and migration guide
- **Testing**: How the changes were tested
- **Screenshots**: If UI changes were made

### Review Process

- All PRs require review before merging
- Address review comments promptly
- Keep discussions focused and productive
- Be open to feedback and suggestions

## Reporting Issues

### Bug Reports

When reporting bugs, please include:

- **Ruby Version**: `ruby -v`
- **Gem Version**: `gem list zayef`
- **OS**: Operating system and version
- **Steps to Reproduce**: Clear, minimal steps to reproduce the issue
- **Expected Behavior**: What you expected to happen
- **Actual Behavior**: What actually happened
- **Error Messages**: Any error messages or stack traces

### Feature Requests

For feature requests, please provide:

- **Use Case**: Describe the problem you're trying to solve
- **Proposed Solution**: How you think it should work
- **Alternatives**: Other solutions you've considered
- **Additional Context**: Screenshots, examples, or references

## Documentation

### Types of Documentation

1. **README.md**: User-facing documentation
2. **CHANGELOG.md**: Version history and changes
3. **Code Comments**: YARD-style comments in the code
4. **Inline Documentation**: Comments explaining complex logic

### Documentation Standards

- Use clear, simple language
- Include code examples where helpful
- Keep documentation up to date with code changes
- Test documentation examples

### Generating Documentation

```bash
# Generate YARD documentation
rake dev:docs

# View documentation
open doc/index.html
```

## Recognition

Contributors will be recognized in:
- CHANGELOG.md for their contributions
- Git history
- Future release announcements

Thank you for contributing to Zayef! Your help makes this project better for everyone. 🇲🇦

