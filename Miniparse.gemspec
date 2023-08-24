# frozen_string_literal: true

require_relative 'lib/Miniparse/version'

Gem::Specification.new do |spec|
  spec.name = 'Miniparse'
  spec.version = Miniparse::VERSION
  spec.authors = ['VetheonGames']
  spec.email = ['ceo@pixelatedstudios.net']

  spec.summary = 'A Gem for Validating and Minifying HTML, CSS, and JS smartly'
  spec.description = 'Miniparse works pretty simply. You pass the Gem some input (HTML, JS, or CSS), and it will
                      validate it, return the validated status, then minify it, and return the minified version as either
                      a file (path) and a text return, respective to what input it got'
  spec.homepage = 'https://git.pixelridgesoftworks.com/PixelRidge-Softworks/Miniparse'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.2'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://git.pixelridgesoftworks.com/PixelRidge-Softworks/Miniparse'
  spec.metadata['changelog_uri'] = 'https://git.pixelridgesoftworks.com/PixelRidge-Softworks/Miniparse/src/branch/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob('{bin,lib,sig}/**/*') + Dir.glob('*').reject do |f|
                                                  f.start_with?('spec', '.rspec', 'Miniparse.gemspec')
                                                end
  spec.files << 'LICENSE.txt'
  spec.files << 'README.md'
  spec.files << 'Miniparse.gemspec'

  spec.require_paths = ['lib']
end
