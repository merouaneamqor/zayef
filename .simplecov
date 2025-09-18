# frozen_string_literal: true

SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/'
  add_filter '/tmp/'

  add_group 'Libraries', 'lib/'

  minimum_coverage 90
  maximum_coverage_drop 5

  # Exclude files that don't need coverage
  add_filter do |source_file|
    source_file.filename =~ /version\.rb$/
  end
end
