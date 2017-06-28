$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'translatable_records/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'translatable_records'
  s.version     = TranslatableRecords::VERSION
  s.authors     = ['mmontossi']
  s.email       = ['mmontossi@museways.com']
  s.homepage    = 'https://github.com/mmontossi/translatable_records'
  s.summary     = 'Record translations for rails.'
  s.description = 'Fully customizable record translations for rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1'

  s.add_development_dependency 'pg', '~> 0.21'
end
